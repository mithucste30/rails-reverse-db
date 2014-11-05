require 'spec_helper'
require 'rails_reverse_db'

describe RailsReverseDb do
  
  before(:each) do
    # run migrations for fake tables
    # ActiveRecord::Migrator.migrate('migrate', nil)
    # ActiveRecord::Migrator.migrate('migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
  end
  
  describe "reverse engineer article table" do
    it "should create scaffolding for Article" do
      g = RailsReverseDb::RailsReverseDb.new
      g.generate
      skip
    end
  end
end
