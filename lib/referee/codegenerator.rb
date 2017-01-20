module Referee
  # Code generation module. Outputs to a .h/.m file specified by configuration.
  class CodeGenerator
    def initialize(project, config)
      @project = project
      @config = config
    end

    public

    def generate!
      if @config.language == 'objc'
        generate_objc!
      else
        generate_swift!
      end
    end

    private

    def generate_objc!
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

    def generate_swift!
      # Substitute out template information.
      swift_impl = renderer.render_swift_implementation(dictionary_representation)

      # Generate path.
      file_path = resource_file('swift')

      # Write to file.
      File.write(file_path, swift_impl)
    end

    def dictionary_representation
      @dictionary_representation ||= create_dictionary_representation
    end

    # Converts the resources into a Mustache-compatible template dictionary.
    def create_dictionary_representation
      dict = { storyboards: [],
               table_cells: [],
               collection_cells: [],
               view_controllers: [],
               view_controllers_imports: [],
               segues: [],
               prefix: @config.prefix }

      @project.resources.each do |group|
        dict[:storyboards] << group.storyboard
        dict[:table_cells] += group.table_cells
        dict[:collection_cells] += group.collection_cells
        dict[:view_controllers] += group.view_controllers
        dict[:view_controllers_imports] += group.view_controllers_imports
        dict[:segues] += group.segues
      end

      # Build up flags.
      dict[:has_table_cells] = (dict[:table_cells].count > 0)
      dict[:has_collection_cells] = (dict[:collection_cells].count > 0)
      dict[:has_segues] = (dict[:segues].count > 0)

      dict
    end

    def resource_file(extension)
      if @config.language == 'objc'
        filename = "#{@config.prefix}Resources.#{extension}"
        File.join(@config.output, filename)
      else
        filename = "Resources.#{extension}"
        File.join(@config.output, filename)
      end
    end

    def renderer
      @render ||= TemplateRenderer.new
    end
  end
end
