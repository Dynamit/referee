module Referee
  # Renderable implementation for UIViewControllers embedded in storyboards.
  class ViewController < Renderable
    attr_accessor :name, :storyboard, :config

    def initialize(name, klass, storyboard, config)
      @name = name
      @class = klass
      @storyboard = storyboard
      @type = "#{@class} *"
      @swift_type = @class
      @config = config
    end

    def declaration
      simple_method_declaration @name
    end

    def implementation
      bundle = bundle_accessor(@config.bundle_id)
      body = "(#{@type})[[UIStoryboard storyboardWithName:@\"#{@storyboard}\" bundle:#{bundle}] " \
             "instantiateViewControllerWithIdentifier:@\"#{@name}\"]"
      simple_method_implementation @name, body
    end

    def swift_implementation
      bundle = swift_bundle_accessor(@config.bundle_id)

      if @swift_type == 'UIViewController'
        cast = ''
      else
        cast = "as! #{@swift_type}"
      end

      body = "UIStoryboard(name: \"#{@storyboard}\", bundle: #{bundle})." \
             "instantiateViewControllerWithIdentifier(\"#{@name}\") #{cast}"
      simple_swift_method @name, body
    end
  end
end
