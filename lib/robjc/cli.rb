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
      {}
    end

    def execute
      load_project
      generate_code
    end

    def load_project
      build_output.info "Parsing project resources..."
    end

    def generate_code
      build_output.info "Generating code..."
    end

    def build_output
      @build_output ||= BuildOutput.new(@config)
    end
  end
end
