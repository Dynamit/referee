module Referee
  # Renderable implementation for UITableViewCell identifiers embedded in storyboards.
  class TableCell < Renderable
    def initialize(identifier)
      @identifier = identifier
      @type = 'NSString *'
      @swift_type = 'String'
    end

    def declaration
      simple_method_declaration @identifier
    end

    def implementation
      simple_method_implementation @identifier, "@\"#{@identifier}\""
    end

    def swift_implementation
      simple_swift_string_case @identifier
    end
  end
end
