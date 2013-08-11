require_dependency "dbd_onto_engine/application_controller"

module DbdOntoEngine
  class OntologiesController < ApplicationController
    def index
      @ontologies = %w{context meta}
    end
  end
end
