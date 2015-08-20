module RObjc
  # Abstract class defining how renderable resources must behave.
  class Renderable
    @type = nil

    def initialize
      fail 'Abstract class Renderable may not be instantiated!'
    end

    # NOTE: Subclasses must implement this method.
    def declaration
      fail 'Subclasses must implement declaration()!'
    end

    # NOTE: Subclasses must implement this method.
    def implementation
      fail 'Subclasses must implement implementation()!'
    end

    def simple_method_declaration(name)
      "- (#{@type})#{name};"
    end

    def simple_method_implementation(name, body)
      "(- (#{@type})#{name}\n{\n\treturn #{body};\n}"
    end
  end
end
