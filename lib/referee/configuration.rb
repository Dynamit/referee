module Referee
  # Configuration container.
  class Configuration
    attr_accessor :project, :prefix, :output, :error_on_missing_storyboard_ids, :verbose, :language

    def initialize(config)
      config.each do |key, value|
        send("#{key}=", value)
      end
    end
  end
end
