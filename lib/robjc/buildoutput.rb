module RObjc
  # Class providing an Xcode-parseable output mechanism.
  class BuildOutput
    def initialize(config)
      @config = config
    end

    # Outputs an informational message.
    def info(msg)
      puts msg if @config.verbose
    end

    # Outputs a message tagged as a warning for Xcode.
    def warn(msg)
      puts "warning: #{msg}"
    end

    # Outputs a message tagged as an error for Xcode.
    def error(msg)
      puts "error: #{msg}"
    end

    # Outputs an error message and quits with an error status.
    def die(msg, status = 1)
      error msg
      Kernel.exit status
    end
  end
end
