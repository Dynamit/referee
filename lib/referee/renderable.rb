module Referee
  # Abstract class defining how renderable resources must behave.
  class Renderable
    attr_accessor :type, :swift_type

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

    # NOTE: Subclasses must implement this method.
    def swift_implementation
      fail 'Subclasses must implement swift_implementation()!'
    end

    def methodize_name(name)
      name.gsub(/[^a-zA-Z0-9]/, '')
    end

    def simple_method_declaration(name)
      clean_name = methodize_name(name)
      "- (#{@type})#{clean_name};"
    end

    def simple_method_implementation(name, body)
      clean_name = methodize_name(name)
      "- (#{@type})#{clean_name}\n{\n\treturn #{body};\n}"
    end

    def simple_swift_method(name, body)
      clean_name = methodize_name(name)
      "func #{clean_name}() -> #{@swift_type} {\n\t\t\treturn #{body}\n\t\t}"
    end

    def simple_swift_string_case(name)
      clean_name = methodize_name(name)
      "case #{clean_name} = \"#{name}\""
    end
  end
end
