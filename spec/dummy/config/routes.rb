Rails.application.routes.draw do
  mount DbdOntoEngine::Engine => "/"
end
