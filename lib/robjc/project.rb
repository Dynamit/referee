module RObjc
  # Helper subclass of `Xcode::Project`.
  # Provides accessors into resources, etc.
  class Project < ::Xcodeproj::Project
    STORYBOARD_FILETYPE = 'file.storyboard'

    attr_accessor :config

    # Instantiate a new `Project` instance given a `Configuration`.
    def self.new_with_config(config)
      project = self.new(config.project)
      project.initialize_from_file
      project.config = config
      project.parse_project
      project
    end

    def parse_project
      find_storyboards.each do |storyboard|
        # Parse out XML representation.
        xml = storyboard_xml(storyboard)
        tableCells = table_cells(xml)
      end
    end

    private

    # Search project for files matching the known storyboard type.
    def find_storyboards
      all_files = files
      all_files.keep_if { |f| f.last_known_file_type == STORYBOARD_FILETYPE }
    end

    def storyboard_xml(storyboard)
      file = File.open(storyboard.real_path)
      doc = Nokogiri::XML(file)
    end

    def table_cells(xml)
      cells = xml.css("tableViewCell")
      cells.map { |n| n["reuseIdentifier"] }.compact.uniq
    end

    def collection_cells(xml)
      cells = xml.css("collectionViewCell")
      cells.map { |n| n["reuseIdentifier"] }.compact.uniq
    end

    def view_controllers(xml)

    end
  end
end
