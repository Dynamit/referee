module RObjc
  # Renderable implementation for UICollectionViewCell identifiers embedded in storyboards.
  class CollectionCell < Renderable
    def initialize(identifier)
      @identifier = identifier
      @type = 'NSString *'
    end

    def declaration
      simple_method_declaration @identifier
    end

    def implementation
      simple_method_implementation @identifier, @identifier
    end
  end
end
