require 'spec_helper'

module DbdOntoEngine
  describe "Ontologies" do
    describe "GET /ontologies" do

      before(:each) { visit dbd_onto_engine.root_path }

      it "shows the ontologies" do
        expect(page).to have_text('Ontologies')
      end

      it "shows the link to the context ontology" do
        expect(page).to have_text('Context')
      end

      it "shows the link to the meta ontology" do
        expect(page).to have_text('Meta')
      end
    end
  end
end
