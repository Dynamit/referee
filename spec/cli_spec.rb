# Tests/specification for the Referee CLI.
require_relative '../lib/referee'
require_relative 'helpers'

# Test paths.
TEST_PATH = Helpers.path_to_test_resource ''
XCODE_PROJECT = Helpers.path_to_test_resource 'TestingProject/TestingProject.xcodeproj'

# Expected paths.
EXPECTED_SWIFT = 'Resources.swift.expected'
EXPECTED_M = 'TESTResources.m.expected'
EXPECTED_H = 'TESTResources.h.expected'

# Generated paths.
GENERATED_SWIFT = 'Resources.swift'
GENERATED_M = 'TESTResources.m'
GENERATED_H = 'TESTResources.h'

# Extra test-specific helpers.
OBJC_ARGS = "-l objc -x #{XCODE_PROJECT} -o #{TEST_PATH} -p TEST".split ' '
SWIFT_ARGS = "-l swift -x #{XCODE_PROJECT} -o #{TEST_PATH}".split ' '

def clean_test_files
  File.unlink Helpers.path_to_test_resource(GENERATED_SWIFT)
  File.unlink Helpers.path_to_test_resource(GENERATED_M)
  File.unlink Helpers.path_to_test_resource(GENERATED_H)
rescue StandardError
  puts 'No testing files to remove!'
end

# Specification/tests.
describe Referee do
  before :each do
    clean_test_files
  end

  describe '#execute' do
    it 'should generate the appropriate classes, enums, and casts for Swift' do
      Referee::CLI.new(SWIFT_ARGS).execute

      expected = Helpers.read_test_resource(EXPECTED_SWIFT)
      generated = Helpers.read_test_resource(GENERATED_SWIFT)
      expect(expected).to eq(generated)
    end

    it 'should generate the appropriate classes, enums, and casts for Objective-C' do
      Referee::CLI.new(OBJC_ARGS).execute

      expected_h = Helpers.read_test_resource(EXPECTED_H)
      generated_h = Helpers.read_test_resource(GENERATED_H)
      expect(expected_h).to eq(generated_h)

      expected_m = Helpers.read_test_resource(EXPECTED_M)
      generated_m = Helpers.read_test_resource(GENERATED_M)
      expect(expected_m).to eq(generated_m)
    end
  end
end
