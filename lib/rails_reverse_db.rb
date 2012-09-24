require 'rails_reverse_db/rails_reverse_db_helper'

module RailsReverseDb
  raise "This gem must be run from a Rails Application" if not defined?(Rails)
  require 'rails_reverse_db/railtie.rb'
  class RailsReverseDb

    delegate :connection, :establish_connection, to: ActiveRecord::Base
    
    def initialize(options = {})
      @pk = options[:pk] || 'id'
      environments = [Rails.env]

      configurations = ActiveRecord::Base.configurations.values_at(*environments)
      @configuration = configurations.first
      establish_connection @configuration
    end
    
    def get_tables
      tables = ActiveRecord::Base.connection.tables
      # remove some tables that are used for migrations
      tables - ["schema_migrations", "propel_migration", "migration_version"]
    end

    def generate
      tables = self.get_tables
      tables.each do |table|
        if RailsReverseDbHelper::RailsReverseDbHelper.test_singularity(table)
          # already singular
          singular ||= table
          plural ||= table.pluralize()
        else
          # already plural
          singular ||= table.singularize()
          plural ||= table
        end
        
        singular = RailsReverseDbHelper::RailsReverseDbHelper.ucwords(singular)
        singular.gsub!(' ', '')
        
        # Credit to Anthony Heukmes for the next few lines
        # Modified to work with my gem
        eval "class #{singular} < ActiveRecord::Base; set_table_name '#{table}' end"
        klass = eval "#{singular}"
        reverse_command = "rails generate scaffold #{singular} "
        klass.columns.each do |col|
          reverse_command << col.name + ":" + col.type.to_s + " " unless col.name == @pk
        end
        system reverse_command
      end
    end
  end
end