module Referee
  # Renderable implementation for UIViewControllers embedded in storyboards.
  class ViewController < Renderable
    attr_accessor :name, :storyboard

    def initialize(name, storyboard)
      @name = name
      @storyboard = storyboard
      @type = 'UIViewController *'
      @swift_type = 'UIViewController'
    end

    def declaration
      simple_method_declaration @name
    end

    def implementation
      body = "[[UIStoryboard storyboardWithName:@\"#{@storyboard}\" bundle:[NSBundle mainBundle]] " \
             "instantiateViewControllerWithIdentifier:@\"#{@name}\"]"
      simple_method_implementation @name, body
    end

    def swift_implementation
      body = "UIStoryboard(name: \"#{@name}\", bundle: NSBundle.mainBundle())." \
             "instantiateViewControllerWithIdentifier(\"#{@name}\")"
      simple_swift_method @name, body
    end
  end
end
