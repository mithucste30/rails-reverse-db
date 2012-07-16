module ReverseScaffold

  class Engine < Rails::Engine

    initialize "reverse_scaffold.load_app_instance_data" do |app|
      ReverseScaffold.setup do |config|
        config.app_root = app.root
      end
    end

  end

end
