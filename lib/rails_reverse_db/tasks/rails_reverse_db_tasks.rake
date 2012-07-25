require 'rails_reverse_db/rails_reverse_db_helper'

namespace :rails_reverse_db do
  desc "Generate scaffolding from tables in database"
  task :scaffold => :environment  do
    g = RailsReverseDb::RailsReverseDb.new
    g.run
  end
end