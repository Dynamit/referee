module RObjc
  # Class providing an Xcode-parseable output mechanism.
  class BuildOutput
    def initialize(config)
      @config = config
    end

    # Outputs an informational message.
    def info(msg)
      puts msg if @config[:verbose]
    end

    # Outputs a message tagged as a warning for Xcode.
    def warn(msg)
      puts "warning: #{msg}"
    end

    # Outputs a message tagged as an error for Xcode.
    def error(msg)
      puts "error: #{msg}"
    end

    def die(msg)
      error msg
      Kernel.exit 1
    end
  end
end
