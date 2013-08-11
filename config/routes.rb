DbdOntoEngine::Engine.routes.draw do
  get('/ontologies' => 'ontologies#index')
end
