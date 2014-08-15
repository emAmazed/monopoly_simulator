task :default => :test_all
   
require "#{ENV['PATH_DB_DEV']}/file_watcher/lib/file_watcher"

desc "Run all test cases (default)"
task :test_all do
  sh %{clear}
  FileList['test/*_tc.rb'].each do |testcase|
    sh %{ruby -Ilib #{testcase} | colorize_minitest}
  end
end
 
desc "Watch files for continuous testing"
task :watch do
  sh %{clear \; echo Watching for file changes...}
  FileWatcher.new('\.rb|Rakefile').on_change do
    sh %{rake}
  end
end
