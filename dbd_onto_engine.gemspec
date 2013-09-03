$:.push File.expand_path("../lib", __FILE__)

require "dbd_onto_engine/version"

Gem::Specification.new do |s|
  s.name        = "dbd_onto_engine"
  s.version     = DbdOntoEngine::VERSION
  s.authors     = ["Peter Vandenabeele"]
  s.email       = ["peter@vandenabeele.com"]
  s.homepage    = "https://github.com/petervandenabeele/dbd_onto_engine"
  s.summary     = "Display dbd_onto as part of a web app."
  s.description = "A Rails engine that serves the dbd_onto ontology."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 4.0.0'
  s.add_dependency 'haml'
  s.add_dependency 'dbd_onto'

  s.add_development_dependency 'haml-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'terminal-notifier-guard'
  s.add_development_dependency 'capybara'
end
