require 'rake/packagetask'

$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'robjc/version'

namespace :release do
  Rake::PackageTask.new('robjc', RObjc::VERSION) do |p|
    p.need_tar_gz = true
    p.package_files.include('lib/**/*')
    p.package_files.include('exe/*')
    p.package_files.include('resources/*')
    p.package_files.include('README.md')
    p.package_files.include('LICENSE.txt')
  end
end
