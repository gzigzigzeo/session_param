require "rake"

begin
  require 'rspec'  
  require 'rspec/core/rake_task'

  desc 'Default: run specs'
  task :default => :spec
  Rspec::Core::RakeTask.new do |t|
    t.pattern = "spec/**/*_spec.rb"
  end
rescue LoadError
  puts "Rspec not available. Install it with: gem install rspec"
end

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "session_param"
    gem.summary = "Easy method to save search parameters in session and populate them from params[] "
    gem.email = "gzigzigzeo@gmail.com"
    gem.homepage = "http://github.com/gzigzigzeo/session_param"
    gem.authors = ["Victor Sokolov"]
    gem.files = Dir["*", "{app}/**/*", "{lib}/**/*"]
    
    gem.add_dependency "rails", "~> 3.0.0"    
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end