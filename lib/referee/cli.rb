module Referee
  # Command line interface.
  # Thanks to http://pewpewthespells.com/blog/buildsettings.html for the list
  # of valid Xcode build variables.
  class CLI
    def initialize(args)
      @config = parse_args(args)
      validate_config
    end

    public

    def execute
      build_output.info "referee v#{VERSION} starting..."
      load_project
      generate_code
    end

    private

    def parse_args(args)
      # Build optparse instance to go through all command line parameters.
      options = { project: default_project_directory,
                  prefix: nil,
                  output: default_output_directory,
                  error_on_missing_storyboard_ids: false,
                  language: 'objc',
                  verbose: false }

      optparse = OptionParser.new do |opts|
        opts.on('-x', '--xcode-project PROJECT', 'Set the Xcode project to parse') do |proj|
          options[:project] = proj
        end

        opts.on('-p', '--prefix PREFIX', 'Set the class prefix for generated code') do |prefix|
          options[:prefix] = prefix
        end

        opts.on('-o', '--output OUTPUT', 'Output generated files to this directory') do |output|
          options[:output] = output
        end

        opts.on('-e', '--error-on-missing-ids', 'Issue errors on missing storyboard IDs') do
          options[:error_on_missing_storyboard_ids] = true
        end

        opts.on('-l', '--language LANGUAGE', 'Toggle language between objc and swift') do |language|
          options[:language] = language.downcase
        end

        opts.on('-v', '--verbose', 'Enable verbose mode') do
          options[:verbose] = true
        end

        opts.on('-h', '--help', 'Display this screen') do
          puts opts
          Kernel.exit
        end

        opts.on('--version', 'Display version info') do
          puts "v#{VERSION}"
          Kernel.exit
        end
      end

      # Parse arguments and convert to `Configuration` type.
      optparse.parse!(args)
      Configuration.new(options)
    end

    def validate_config
      is_swift = (@config.language == 'swift')
      output_valid = File.exist?(@config.output) && File.writable?(@config.output)
      build_output.die 'Class prefix must be provided' unless (is_swift || @config.prefix)
      build_output.info 'Class prefix will ignored...' if (is_swift && @config.prefix)
      build_output.die 'Output directory must exist and be writable' unless output_valid
      build_output.die 'An Xcode project is required!' unless @config.project
      build_output.die 'Xcode project must exist!' unless File.exist?(@config.project)
      build_output.die 'Invalid language specified!' unless ['swift', 'objc'].index(@config.language)
      build_output.info 'Loaded and validated configuration...'
    end

    def default_project_directory
      # Attempt to find a compiling project.
      ENV['PROJECT_FILE_PATH']
    end

    def default_output_directory
      # Assume standard <project_directory>/<project_name>/... for source.
      # Otherwise, just output to the current directory.
      proj_dir = ENV['PROJECT_DIR']
      proj_name = ENV['PROJECT_NAME']

      if proj_dir && proj_name
        File.join proj_dir, proj_name
      else
        Dir.pwd
      end
    end

    def load_project
      build_output.info 'Parsing project resources...'
      @project = Project.new_with_config(@config)
    end

    def generate_code
      build_output.info 'Generating code...'
      @generator = CodeGenerator.new(@project, @config)
      @generator.generate!
    end

    def build_output
      @build_output ||= BuildOutput.new(@config)
    end
  end
end
