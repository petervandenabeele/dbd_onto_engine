require_dependency "dbd_onto_engine/application_controller"

module DbdOntoEngine
  class OntologiesController < ApplicationController
    def index
      @ontologies = %w{provenance meta}
    end
  end
end
