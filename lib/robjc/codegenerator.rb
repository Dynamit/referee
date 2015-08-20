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

    def dictionary_representation
      @dictionary_representation ||= create_dictionary_representation
    end

    # Converts the resources into a Mustache-compatible template dictionary.
    def create_dictionary_representation()
      dict = {storyboards: [],
              table_cells: [],
              collection_cells: [],
              view_controllers: [],
              prefix: @config.prefix}

      @project.resources.each do |group|
        dict[:storyboards] << group.storyboard
        dict[:table_cells] += group.table_cells
        dict[:collection_cells] += group.collection_cells
        dict[:view_controllers] += group.view_controllers
      end

      dict
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
