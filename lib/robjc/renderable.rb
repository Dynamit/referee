module RObjc
  # Abstract class defining how renderable resources must behave.
  class Renderable
    attr_accessor :type

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

    def methodize_name(name)
      name.gsub(/ |-/, '')
    end

    def simple_method_declaration(name)
      clean_name = methodize_name(name)
      "- (#{@type})#{clean_name};"
    end

    def simple_method_implementation(name, body)
      clean_name = methodize_name(name)
      "- (#{@type})#{clean_name}\n{\n\treturn #{body};\n}"
    end
  end
end
