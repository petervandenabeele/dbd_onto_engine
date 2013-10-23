require_dependency "dbd_onto_engine/application_controller"

module DbdOntoEngine
  class OntologiesController < ApplicationController

    def index
      @ontologies = supported_ontologies
    end

    def show
      @ontology = params[:id]
      @ontology_predicates = ontology(@ontology).resources
    end

  private

    def supported_ontologies
      %w{context meta schema dbd}
    end

    def ontology(ontology_name)
      ontology_class(ontology_name).new
    end

    def ontology_class(ontology_name)
      if supported_ontologies.include?(ontology_name)
        "DbdOnto::#{ontology_name.capitalize}".constantize
      else
        raise "Invalid ontology"
      end
    end

  end
end
