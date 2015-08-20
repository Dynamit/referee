module RObjc
  # Command line interface.
  class CLI
    attr_accessor :config

    # Constructor method.
    # Assumes `args` are the list of command line parameters.
    def initialize(args)
      @config = parse_args(args)
    end

    def parse_args(args)
    end

    def execute
    end

    def build_output
      @build_output ||= BuildOutput.new
    end
  end
end
