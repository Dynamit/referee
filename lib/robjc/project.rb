module RObjc
  # Helper subclass of `Xcode::Project`.
  # Provides accessors into resources, etc.
  class Project < ::Xcodeproj::Project
    STORYBOARD_FILETYPE = 'file.storyboard'
    VIEW_CONTROLLER_TAGS = [ 'viewController',
                             'tableViewController',
                             'navigationController',
                             'glkViewController',
                             'pageViewController',
                             'collectionViewController',
                             'splitViewController',
                             'avPlayerViewController',
                             'tabBarController' ]

    attr_accessor :config, :resources

    # Instantiate a new `Project` instance given a `Configuration`.
    def self.new_with_config(config)
      project = self.new(config.project)
      project.initialize_from_file
      project.config = config
      project.parse_project
      project
    end

    def parse_project
      @resources = []

      find_storyboards.each do |storyboard|
        # Parse out XML representation.
        xml = storyboard_xml(storyboard)
        table_cells = table_cells(xml)
        collection_cells = collection_cells(xml)
        view_controllers = view_controllers(xml)

        # Add to resources collection
        group = ResourceGroup.new(storyboard, table_cells, collection_cells, view_controllers)
        @resources << group

        # Check for missing view controller IDs in this storyboard.
        no_missing = view_controllers.compact.uniq

        if no_missing.count != view_controllers.count
          msg = "Missing view controller ID in '#{group.storyboard_name}' storyboard!"

          if @config.error_on_missing_storyboard_ids
            build_output.die msg
          else
            build_output.warn msg
          end
        end
      end

      puts @resources
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
      selector = VIEW_CONTROLLER_TAGS.join(',')
      controllers = xml.css(selector)
      controllers.map { |n| n["storyboardIdentifier"] }
    end

    def build_output
      @build_output ||= BuildOutput.new(@config)
    end
  end
end
