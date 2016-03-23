require 'rake/testtask'

# Rake::TestTask.new do |t|
#   t.pattern = "test/models/*_test.rb"
# end

task :default => :test
task :test do
  Dir.glob('./test/*/*_test.rb').each { |file| require file}
end
