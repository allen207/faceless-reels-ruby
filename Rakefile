require "rake/testtask"
require "rubygems/package_task"

Rake::TestTask.new do |task|
  task.libs << "lib"
  task.libs << "test"
  task.pattern = "test/**/*_test.rb"
  task.warning = true
end

specification = Gem::Specification.load("faceless_reels.gemspec")
Gem::PackageTask.new(specification)

task default: :test

