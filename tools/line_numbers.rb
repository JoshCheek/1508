require 'rouge'
require 'io/console'

# :enabled?,
# :event,
# :lineno,
# :path,
# :method_id,
# :defined_class,
# :binding,
# :self,
# :return_value,
# :raised_exception]]

class LineNums
  attr_accessor :path, :events

  def initialize(path)
    self.path = path
    self.events = []
  end

  def raw_body
    @raw_body ||= File.read path
  end

  def record(event)
    events << event
  end

  def display_each(&block)
    events.each do |event|
      highlighted = highlighted_body(line: event[:lineno])
      block.call(highlighted, event)
    end
  end

  def highlighted_body(line:-1)
    formatter   = Rouge::Formatters::Terminal256.new theme: 'colorful'
    lexer       = Rouge::Lexers::Ruby.new
    tokens      = lexer.lex raw_body
    highlighted = formatter.format(tokens)
    highlighted.lines.map.with_index(1) { |code, lineno|
      maybe_arrow = "  "
      maybe_arrow = "\e[38;5;196m-> \e[0m" if line == lineno
      sprintf "%3s\e[34m%4s\e[0m: %s\r", maybe_arrow, lineno, code
    }.join
  end

  # [tp.event, tp.lineno, tp.method_id, tp.defined_class]
  # [:c_return, 17, :enable, TracePoint]
  # ,[:line, 20, nil, nil]
  # ,[:c_call, 20, :method_added, Module]
  # ,[:c_return, 20, :method_added, Module]
  # ,[:line, 24, nil, nil]
  # ,[:c_call, 24, :method_added, Module]
  # ,[:c_return, 24, :method_added, Module]
  # ,[:line, 28, nil, nil]
  # ,[:call, 20, :a, Object]
  # ,[:line, 21, :a, Object]
  # ,[:call, 24, :c, Object]
  # ,[:line, 25, :c, Object]
  # ,[:return, 26, :c, Object]
  # ,[:return, 22, :a, Object]
end

playground_path = File.expand_path($PROGRAM_NAME, __dir__)
line_nums       = LineNums.new(playground_path)

tp = TracePoint.new do |tp|
  record = File.expand_path(tp.path) == playground_path
  next unless record
  line_nums.record event:            tp.event,
                   lineno:           tp.lineno,
                   method_id:        tp.method_id,
                   defined_class:    tp.defined_class,
                   binding:          tp.binding,
                   self:             tp.self
end

tp.enable
at_exit do
  tp.disable
  $stdin.raw do # ~> Errno::ENOTTY: Inappropriate ioctl for device
    line_nums.display_each do |highlighted, event|
      event_line = event.inspect
      $stdout.print "\e[H\e[2J#{highlighted}\n-----\n#{event_line}\r\n"
      $stdout.print "\e[41;37m Press a key \e[0m"
      break if $stdin.getc.ord == 3 # C-c
    end
  end
end
