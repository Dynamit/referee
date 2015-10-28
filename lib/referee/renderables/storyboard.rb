module Referee
  # Renderable implementation for UIStoryboards in a project.
  class Storyboard < Renderable
    def initialize(name)
      @name = name
      @type = 'UIStoryboard *'
      @swift_type = 'UIStoryboard'
    end

    def declaration
      simple_method_declaration @name
    end

    def implementation
      body = "[UIStoryboard storyboardWithName:@\"#{@name}\" bundle:[NSBundle mainBundle]]"
      simple_method_implementation @name, body
    end

    def swift_implementation
      body = "UIStoryboard(name: \"#{@name}\", bundle: NSBundle.mainBundle())"
      simple_swift_method @name, body
    end
  end
end
