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

    # Provided more as a debugging tool than anything.
    def to_s
      %Q(Storyboard: #{storyboard_name}
      Table Cells: #{@table_cells.count}
      Collection Cells: #{@collection_cells.count}
      View Controllers: #{@view_controllers.count})
    end
  end
end
