$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "reverse_scaffold/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "reverse_scaffold"
  s.version     = ReverseScaffold::VERSION
  s.authors     = ["Chris McKnight"]
  s.email       = ["cmcknight@immense.net"]
  s.homepage    = "http://christophermcknight.us"
  s.summary     = "TODO: Summary of ReverseScaffold."
  s.description = "TODO: Description of ReverseScaffold."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2"
end
