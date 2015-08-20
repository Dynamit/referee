module RObjc
  # Renderable implementation for UIStoryboards in a project.
  class Storyboard < Renderable
    def initialize(name)
      @name = name
      @type = 'UIStoryboard *'
    end

    def declaration
      simple_method_declaration @name
    end

    def implementation
      body = "[UIStoryboard storyboardWithName:@\"#{@name}\" bundle:[NSBundle mainBundle]]"
      simple_method_implementation @name, body
    end
  end
end
