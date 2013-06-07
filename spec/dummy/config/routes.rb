Rails.application.routes.draw do
  mount DbdOntoEngine::Engine => "/ontologies"
end
