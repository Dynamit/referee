# Standard library dependencies.
require 'optparse'

# Third party dependencies.
require 'mustache'
require 'nokogiri'
require 'rubygems'
require 'xcodeproj'

# Internal modules, etc.
require 'referee/buildoutput'
require 'referee/cli'
require 'referee/configuration'
require 'referee/codegenerator'
require 'referee/project'
require 'referee/renderable'
require 'referee/renderables/collectioncell'
require 'referee/renderables/segue'
require 'referee/renderables/storyboard'
require 'referee/renderables/tablecell'
require 'referee/renderables/viewcontroller'
require 'referee/renderables/viewcontrollerimports'
require 'referee/resourcegroup'
require 'referee/templaterenderer'
require 'referee/version'

# Main module declaration.
module Referee
end
