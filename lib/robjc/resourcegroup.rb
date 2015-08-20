module RObjc
  # Representation of all of the resources contained in a given storyboard.
  class ResourceGroup
    attr_accessor :storyboard, :table_cells, :collection_cells, :view_controllers

    def initialize(storyboard, table_cells, collection_cells, view_controllers)
      @storyboard = storyboard
      @table_cells = table_cells
      @collection_cells = collection_cells
      @view_controllers = view_controllers
    end

    def storyboard_name
      basename = File.basename(@storyboard.real_path)
      basename.gsub(/\.storyboard/, '')
    end

    def storyboard
      Storyboard.new(@storyboard)
    end

    def table_cells
      @table_cells.map { |c| TableCell.new(c) }
    end

    def collection_cells
      @collection_cells.map { |c| CollectionCell.new(c) }
    end

    def view_controllers
      @view_controllers.map { |c| ViewController.new(c, storyboard_name) }
    end

    # This is provided more as a debugging tool than anything.
    def to_s
      %Q(Storyboard: #{storyboard_name}
      Table Cells: #{@table_cells.count}
      Collection Cells: #{@collection_cells.count}
      View Controllers: #{@view_controllers.count})
    end
  end
end
