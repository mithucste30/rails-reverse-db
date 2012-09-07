require 'rails_reverse_db/rails_reverse_db_helper'

desc "Generate migrations, models, or scaffold from tables in database"
task :reverse_engineer => :environment  do
  options = { }
  options[:pk] ||= ENV['PK']
  options[:models] ||= ENV['MODELS']
  options[:exclude] ||= ENV['EXCLUDE']
  g = RailsReverseDb::RailsReverseDb.new(options)
  g.generate
end