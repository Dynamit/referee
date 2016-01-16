module Referee
  # Representation of all of the resources contained in a given storyboard.
  class ResourceGroup
    attr_accessor :storyboard, :table_cells, :collection_cells, :view_controllers, :segues, :config

    def initialize(storyboard, table_cells, collection_cells, view_controllers, segues, config)
      @storyboard = storyboard
      @table_cells = table_cells
      @collection_cells = collection_cells
      @view_controllers = view_controllers
      @segues = segues
      @config = config
    end

    def storyboard_name
      basename = File.basename(@storyboard.real_path)
      basename.gsub(/\.storyboard/, '')
    end

    def storyboard
      Storyboard.new(storyboard_name, @config)
    end

    def table_cells
      @table_cells.map { |c| TableCell.new(c) }
    end

    def collection_cells
      @collection_cells.map { |c| CollectionCell.new(c) }
    end

    def view_controllers
      @view_controllers.map do |c|
        identifier = c[:identifier]
        klass = c[:class]
        ViewController.new(identifier, klass, storyboard_name, @config)
      end
    end

    def segues
      @segues.map { |c| Segue.new(c) }
    end
  end
end
