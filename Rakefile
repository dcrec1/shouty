# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

begin
  require 'metric_fu'
rescue Exception => e
  puts e
end

def exec(cmd)
  puts cmd
  system cmd
end

namespace :cucumber do
  task :default => [:'db:test:prepare'] do
    exec "cucumber"
  end
  
  task :enhanced => [:'db:test:prepare', :'culerity:rails:start'] do
    exec "cucumber -p enhanced"
    exec "rake culerity:rails:stop"
  end
  
  task :all => [:default, :enhanced]
end

task :build => [:'db:migrate', :spec, :'cucumber:all', :'metrics:all']