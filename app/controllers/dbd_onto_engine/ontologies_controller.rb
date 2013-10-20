require_dependency "dbd_onto_engine/application_controller"

module DbdOntoEngine
  class OntologiesController < ApplicationController

    def index
      @ontologies = supported_ontologies
    end

    def show
      @ontology = params[:id]
      @ontology_predicates = resources(ontology)
    end

  private

    def supported_ontologies
      %w{context meta schema}
    end

    def ontology_class(ontology_name)
      if supported_ontologies.include? @ontology
        "DbdOnto::#{@ontology.capitalize}".constantize
      else
        raise "Invalid ontology"
      end
    end

    def ontology
      ontology_class(@ontology).new
    end

    # TODO move this to the Dbd::Graph#resources
    def resources(graph)
      graph.subjects.map{ |s| graph.by_subject(s) }.select{ |cs| cs.first.class == Dbd::Fact }
    end

  end
end
