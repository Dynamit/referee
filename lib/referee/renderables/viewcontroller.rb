module Referee
  # Renderable implementation for UIViewControllers embedded in storyboards.
  class ViewController < Renderable
    attr_accessor :name, :storyboard, :config

    def initialize(name, storyboard, config)
      @name = name
      @storyboard = storyboard
      @type = 'UIViewController *'
      @swift_type = 'UIViewController'
      @config = config
    end

    def declaration
      simple_method_declaration @name
    end

    def implementation
      bundle = bundle_accessor(@config.bundle_id)
      body = "[[UIStoryboard storyboardWithName:@\"#{@storyboard}\" bundle:#{bundle}] " \
             "instantiateViewControllerWithIdentifier:@\"#{@name}\"]"
      simple_method_implementation @name, body
    end

    def swift_implementation
      bundle = swift_bundle_accessor(@config.bundle_id)
      body = "UIStoryboard(name: \"#{@name}\", bundle: #{bundle})." \
             "instantiateViewControllerWithIdentifier(\"#{@name}\")"
      simple_swift_method @name, body
    end
  end
end
