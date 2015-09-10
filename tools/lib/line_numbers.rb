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
    min_index   = [line-10, 0].max
    max_index   = min_index+20

    formatter   = Rouge::Formatters::Terminal256.new theme: 'colorful'
    lexer       = Rouge::Lexers::Ruby.new
    tokens      = lexer.lex raw_body
    highlighted = formatter.format(tokens)
    highlighted.lines.map.with_index(1) { |code, lineno|
      gutter = "   \e[34m"
      gutter = "\e[41;37m ->" if line == lineno
      gutter << ("%4d\e[0m: #{code}\r" % lineno)
      gutter
    }[min_index, max_index].join
  end
end
