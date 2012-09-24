require 'rails_reverse_db/rails_reverse_db_helper'

desc "Generate migrations, models, or scaffold from tables in database"
task :reverse_engineer => :environment do
  options = { }
  options[:pk] ||= ENV['pk']
  options[:models] ||= ENV['models']
  options[:exclude] ||= ENV['exclude']
  options[:i] ||= ENV['i']
    
  if (not options[:models].empty?) and (not options[:exclude].empty?)
    raise "The models and exclude arguments should not be used in conjunction with each other. Use one or the other."
  end
  
  g = RailsReverseDb::RailsReverseDb.new(options)
  g.generate
end

namespace :reverse_engineer do
  desc "Reverse Engineer Help"
  task :help => :environment do
    puts "Run rake reverse_engineer to "
    # File.read('docs/help.txt')
  end
  
  desc "Reverse Engineer Version"
  task :version => :environment do
    puts RailsReverseDb::VERSION
  end
end