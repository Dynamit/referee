# Module container helper methods for the tests.
module Helpers
  # Returns a path to a test resource.
  def self.path_to_test_resource(resource_name)
    "./spec/resources/#{resource_name}"
  end

  # Reads the contents of a test resource.
  def self.read_test_resource(resource_name)
    path = path_to_test_resource(resource_name)
    file = File.open(path, 'r')
    contents = file.read
    file.close

    contents
  end
end
