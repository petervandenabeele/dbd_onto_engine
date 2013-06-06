Rails.application.routes.draw do

  mount DbdOntoEngine::Engine => "/dbd_onto_engine"
end
