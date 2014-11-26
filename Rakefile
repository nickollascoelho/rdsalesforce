require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |test|
	test.test_files = FileList['spec/lib/rdsalesforce/*_spec.rb']
	test.verbose = true
end

task default: :test