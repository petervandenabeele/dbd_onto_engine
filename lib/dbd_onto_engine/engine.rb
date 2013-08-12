module DbdOntoEngine
  class Engine < ::Rails::Engine
    isolate_namespace DbdOntoEngine

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.assets false
      g.helper false
      g.template_engine :haml
    end
  end
end
