require 'spec_helper'

module DbdOntoEngine
  describe "Ontologies" do
    describe "GET /ontologies" do
      it "shows the ontologies" do
        visit dbd_onto_engine.root_path
        expect(page).to have_text('Ontologies')
      end

      it "shows the provenance ontology" do
        visit dbd_onto_engine.root_path
        expect(page).to have_text('Context')
      end

      it "shows the meta ontology" do
        visit dbd_onto_engine.root_path
        expect(page).to have_text('Meta')
      end
    end
  end
end
