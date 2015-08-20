module RObjc
  # Manages finding and rendering code templates to strings.
  class TemplateRenderer
    INTERFACE_TEMPLATE_NAME = 'interface.h'
    IMPLEMENTATION_TEMPLATE_NAME = 'implementation.m'

    private

    def filepath_from_root(path)
      # TODO: Can this be ported to an installation-method agnostic algorithm?
      spec = ::Gem::Specification.find_by_name 'robjc'
      gem_root = spec.gem_dir
      File.join(gem_root, path)
    end

    def template(name)
      path = filepath_from_root(File.join('resources', name))
      contents = File.read(path)
      proc { |dict| ::Mustache.render(contents, dict) }
    end

    public

    # Renders the implementation (.m) file as a string.
    def render_implementation(dict)
      template(IMPLEMENTATION_TEMPLATE_NAME).call(dict)
    end

    # Renders the interface (.h) file as a string.
    def render_interface(dict)
      template(INTERFACE_TEMPLATE_NAME).call(dict)
    end
  end
end
