module RObjc
  # Abstract class defining how renderable resources must behave.
  class Renderable
    def initialize
      raise 'Abstract class Renderable may not be instantiated!'
    end

    # NOTE: Subclasses must implement this method.
    def declaration
      raise 'Subclasses must implement declaration()!'
    end

    # NOTE: Subclasses must implement this method.
    def implementation
      raise 'Subclasses must implement implementation()!'
    end
  end
end
