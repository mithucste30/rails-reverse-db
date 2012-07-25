require 'rails_reverse_db'
require 'rails'
require 'active_model/railtie'
require 'action_controller/railtie'

module RailsReverseDb

  class Railtie < Rails::Railtie
    rake_tasks do
      load 'rails_reverse_db/tasks/rails_reverse_db_tasks.rake'
    end
  end

end