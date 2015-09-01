module Referee
  # Manages finding and rendering code templates to strings.
  class TemplateRenderer
    INTERFACE_TEMPLATE_NAME = 'interface.h'
    IMPLEMENTATION_TEMPLATE_NAME = 'implementation.m'

    private

    def filepath_from_root(path)
      app_dir = File.dirname(File.expand_path(__FILE__))
      File.join(app_dir, '../..', path)
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
