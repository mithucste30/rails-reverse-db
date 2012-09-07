$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_reverse_db/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_reverse_db"
  s.version     = RailsReverseDb::VERSION
  s.authors     = ["Chris McKnight"]
  s.email       = ["cmckni3@gmail.com"]
  s.homepage    = "http://christophermcknight.us"
  s.summary     = "Reverse Engineer existing databases"
  s.description = "Reverse engineer existing databases and generate migrations, models, or scaffolding"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  
  s.add_runtime_dependency "sqlite3"
  s.add_runtime_dependency "mysql2"
  s.add_runtime_dependency "pg"
  s.add_runtime_dependency "railties"
end
