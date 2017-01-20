module Referee
  # Renderable implementation for UIStoryboards in a project.
  class Storyboard < Renderable
    attr_accessor :name, :config

    def initialize(name, config)
      @name = name
      @type = 'UIStoryboard *'
      @swift_type = 'UIStoryboard'
      @config = config
    end

    def declaration
      clean_name = @name.tap { |e| e[0] = e[0].downcase }
      simple_method_declaration clean_name
    end

    def implementation
      bundle = bundle_accessor(@config.bundle_id)
      body = "[UIStoryboard storyboardWithName:@\"#{@name}\" bundle:#{bundle}]"
      simple_method_implementation @name, body
    end

    def swift_implementation
      bundle = swift_bundle_accessor(@config.bundle_id)
      body = "UIStoryboard(name: \"#{@name}\", bundle: #{bundle})"
      simple_swift_method @name, body
    end
  end
end
