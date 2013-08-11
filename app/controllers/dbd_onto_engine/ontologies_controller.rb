require_dependency "dbd_onto_engine/application_controller"

module DbdOntoEngine
  class OntologiesController < ApplicationController
    def index
      @ontologies = supported_ontologies
    end

    def show
      @ontology = params[:id]
      @ontology_predicates = ontology_class(@ontology).new.
        select{ |e| e.predicate == 'meta:defines_predicate'}.
        map(&:object)
    end

  private

    def supported_ontologies
      %w{context meta}
    end

    def ontology_class(ontology_name)
      if supported_ontologies.include? @ontology
        Object.const_get("DbdOnto::#{@ontology.capitalize}")
      else
        raise "Invalid ontology"
      end
    end
  end
end
