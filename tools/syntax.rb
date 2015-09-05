require 'parser/current'
class ToSyntax
  # receives raw ruby code (a String)
  # return a data structure that can be directly converted into json
  # meaning String, Array, Hash, Fixnum, Float, nil, true, false
  def self.call(raw_code, options={})
    new(raw_code, options).call
  end

  def initialize(raw_code, filename: '(eval)')
    self.raw_code = raw_code
    self.filename = filename
  end

  def call
    translate parse(raw_code, filename)
  end

  private

  attr_accessor :raw_code, :filename

  def parse(raw_code, file)
    buffer                             = Parser::Source::Buffer.new(filename)
    buffer.source                      = raw_code
    builder                            = Parser::Builders::Default.new
    builder.emit_file_line_as_literals = false
    parser                             = Parser::CurrentRuby.new builder
    parser.parse buffer
  end

  def assert_children(ast, n)
    num_children = ast.children.size
    return if num_children == n
    raise "Wrong number of children: Expected:#{n.inspect}, Actual:#{num_children.inspect} in #{ast.inspect}"
  end

  def translate(ast)
    return nil if ast.nil?

    case ast.type
    # e.g. "1"
    when :int
      assert_children ast, 1
      { type:     :integer,
        value:    ast.children[0].to_s,
      }
    # e.g. "1.0"
    when :float
      assert_children ast, 1
      { type:     :float,
        value:    ast.children[0].to_s,
      }
    # e.g. ":abc"
    when :sym
      assert_children ast, 1
      { type:     :symbol,
        value:    ast.children[0].to_s,
      }
    # e.g. ':"a#{1}b"'
    when :dsym
      { type:     :interpolated_symbol,
        segments: ast.children.map { |child| translate child },
      }
    # e.g. "'abc'"
    when :str
      assert_children ast, 1
      { type:     :string,
        value:    ast.children[0].to_s,
      }
    # e.g. "%(a#{1}b)"
    when :dstr
      { type:     :interpolated_string,
        segments: ast.children.map { |child| translate child },
      }
    # e.g. `echo hello`
    when :xstr
      { type:     :executable_string,
        segments: ast.children.map { |child| translate child },
      }
    # e.g. "true"
    when :true
      assert_children ast, 0
      { type: :true }
    # e.g. "false"
    when :false
      assert_children ast, 0
      { type: :false }
    # e.g. "nil"
    when :nil
      assert_children ast, 0
      { type: :nil }
    # e.g. "1;2" and "(1;2)"
    when :begin
      { type:        :expressions,
        expressions: ast.children.map { |child| translate child },
      }
    # e.g. "begin;1;2;end"
    when :kwbegin
      { type:        :keyword_begin,
        expressions: ast.children.map { |child| translate child },
      }
    # e.g. "a.b(c)"
    when :send
      target, message, *args = ast.children
      { type:     :send,
        target:   translate(target),
        message:  message.to_s,
        args:     args.map { |arg| translate arg },
      }
    # e.g. "val = 1"
    when :lvasgn
      assert_children ast, 2
      { type:     :set_local_variable,
        name:     ast.children[0].to_s,
        value:    translate(ast.children[1]),
      }
    # e.g. "val = 1; val" NOTE: if you do not set the local first, then it becomes a send instead (ie parser is aware of the local)
    when :lvar
      assert_children ast, 1
      { type:     :get_local_variable,
        name:     ast.children[0].to_s,
      }
    # e.g. "/a/i"
    when :regexp
      *segments, opts = ast.children
      raise "Expected #{opts.inspect} to be a regopt!" unless opts.type == :regopt
      { type:     :regular_expression,
        segments: segments.map { |segment| translate segment },
        options:  {
          ignorecase: opts.children.include?(:i),
          extended:   opts.children.include?(:x),
          multiline:  opts.children.include?(:m),
        },
      }
    # e.g. [100, 200, 300]
    when :array
      { type:     :array,
        elements: ast.children.map { |child| translate child },
      }
    # e.g. "class A; end"
    when :class
      # (class (const nil :A) nil nil)
      assert_children ast, 3
      namespace, superclass, body = ast.children

      { type:       :class,
        name_lookup:translate(namespace),
        superclass: translate(superclass),
        body:       translate(body),
      }
    # (def :a (args (arg :b)) (int 1))
    when :def
      assert_children ast, 3
      name, args, body = ast.children
      { type:     :method_definition,
        name:     name.to_s,
        args:     args.children.map { |arg| translate arg },
        body:     translate(body),
      }
    # e.g. the b in `def a(b) 1 end`
    when :arg
      # (def :a (args (arg :b)) (int 1))
      assert_children ast, 1
      { type:     :required_arg,
        name:     ast.children.first.to_s,
      }
    when :restarg
      assert_children ast, 1
      { type:     :rest_arg,
        name:     ast.children.first.to_s,
      }
    when :const
      # TODO: __ENCODING__
      assert_children ast, 2
      namespace, name = ast.children
      { type:      :constant,
        namespace: translate(namespace),
        name:      name.to_s,
      }
    # e.g. the :: in `class ::A; end`
    when :cbase
      assert_children ast, 0
      { type:     :toplevel_constant,
      }
    # e.g. self
    when :self
      assert_children ast, 0
      { type:     :self,
      }
    # e.g. @abc
    when :ivar
      assert_children ast, 1 # (ivar :@abc)
      { type:     :get_instance_variable,
        name:     ast.children.first.to_s,
      }
    # e.g. @abc = 1
    when :ivasgn
      assert_children ast, 2 # (ivasgn :@abc (int 1))
      { type:     :set_instance_variable,
        name:     ast.children.first.to_s,
        value:    translate(ast.children.last),
      }
    else
      raise "No case for #{ast.inspect}"
    end
  end
end


require 'pp'
raise "Provide a filename! <3" if ARGV.empty?
body = File.read ARGV[0]
pp ToSyntax.call body
