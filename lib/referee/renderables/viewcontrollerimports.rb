module Referee
  # Renderable implementation for UIViewControllers embedded in storyboards.
  class ViewControllerImports < Renderable
    attr_accessor :class

    def initialize(klass)
      @class = klass
    end

    def declaration
      "@class #{@class};"
    end

    def implementation
    end

    def swift_implementation
    end
  end
end
