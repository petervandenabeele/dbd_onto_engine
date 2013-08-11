DbdOntoEngine::Engine.routes.draw do
  get '/ontologies' => 'ontologies#index'
  get '/ontologies/:id' => 'ontologies#show', as: 'ontology'
end
