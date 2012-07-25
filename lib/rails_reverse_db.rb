require 'rails_reverse_db/rails_reverse_db_helper'

module RailsReverseDb
  require 'rails_reverse_db/railtie.rb' if defined?(Rails)
  class RailsReverseDb

    delegate :connection, :establish_connection, to: ActiveRecord::Base
    
    def initialize
      environments = [Rails.env]

      configurations = ActiveRecord::Base.configurations.values_at(*environments)
      @configuration = configurations.first
      @pk = 'id'
      establish_connection @configuration
      
      # configurations = ActiveRecord::Base.configurations.values_at(*environments)
      # configurations.compact.each do |configuration|
      #   yield configuration unless configuration['database'].blank?
      # end
    end
    
    def get_tables
      tables = ActiveRecord::Base.connection.execute("SHOW TABLES")
      tables = tables.to_a.map(&:join)
      tables.each do |table|
      end
      tables
    end

    def run
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
        
        eval "class #{singular} < ActiveRecord::Base; set_table_name '#{table}' end"
        klass = eval "#{singular}"
        reverse_command = "rails generate scaffold #{singular} "
        klass.columns.each do |col|
          reverse_command << col.name + ":" + col.type.to_s + " " unless col.name == @pk
        end
        # system reverse_command + opts.skip_migration
      end
    end
  end
end