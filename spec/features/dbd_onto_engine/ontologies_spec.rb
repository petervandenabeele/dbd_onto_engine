require 'spec_helper'

module DbdOntoEngine
  describe "Ontologies" do
    describe "GET /ontologies" do

      context "routing" do
        it "when the engine is mounted under /" do
          dbd_onto_engine.ontologies_path.should == '/ontologies'
        end
      end

      context "page content" do

        before(:each) do
          visit(dbd_onto_engine.ontologies_path)
        end

        it "shows the ontologies" do
          expect(page).to have_text('Ontologies')
        end

        it "shows the link to the context ontology" do
          #expect(page).to have_link(url_for(action: 'show', id: 'context')) # have_text('Context')
          expect(page).to have_text('Context')
        end

        it "shows the link to the meta ontology" do
          expect(page).to have_text('Meta')
        end
      end
    end

    describe "GET /ontologies/:id" do

      context "routing" do
        it "when the engine is mounted under /" do
          dbd_onto_engine.ontology_path(id: 'foo').should == '/ontologies/foo'
        end
      end

      context "security" do
        it "raises error for invalid ontology name" do
          expect{ visit dbd_onto_engine.ontology_path(id: 'foobar') }.to raise_error(RuntimeError)
        end
      end

      context "page content" do

        before(:each) { visit dbd_onto_engine.ontology_path(id: 'context') }

        it "shows the context ontology" do
          expect(page).to have_text('Context')
        end

        it "shows the context:visibility predicate" do
          expect(page).to have_text('context:visibility')
        end
      end
    end
  end
end
