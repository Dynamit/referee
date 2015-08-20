module RObjc
  # Code generation module. Outputs to a .h/.m file specified by configuration.
  class CodeGenerator
    def initialize(project, config)
      @project = project
      @config = config
    end

    public

    def generate!
      # Substitute out template information.
      iface = renderer.render_interface(dictionary_representation)
      impl = renderer.render_implementation(dictionary_representation)

      # Generate paths.
      interface_path = resource_file('h')
      implementation_path = resource_file('m')

      # Write to files.
      File.write(interface_path, iface)
      File.write(implementation_path, impl)
    end

    private

    # Converts the resources into a Mustache-compatible template dictionary.
    def dictionary_representation
      # TODO: Build this out...
      {}
    end

    def resource_file(extension)
      filename = "#{@config.prefix}Resources.#{extension}"
      File.join(@config.output, filename)
    end

    def renderer
      @render ||= TemplateRenderer.new
    end
  end
end
