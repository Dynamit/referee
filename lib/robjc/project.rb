module RObjc
  # Helper subclass of `Xcode::Project`. Provides accessors into resources, etc.
  class Project < ::Xcodeproj::Project
    STORYBOARD_FILETYPE = 'file.storyboard'

    def initialize(config)
      @config = config
    end

    def storyboard_xml(storyboard)
      file = File.open(storyboard.real_path)
      doc = Nokogiri::XML(file)
    end
  end
end
