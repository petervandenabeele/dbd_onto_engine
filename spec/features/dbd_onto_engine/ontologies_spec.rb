require 'spec_helper'

module DbdOntoEngine
  describe "Ontologies" do
    describe "GET /ontologies" do

      context "routing" do
        it "when the engine is mounted under /" do
          dbd_onto_engine.ontologies_path.should == '/ontologies'
        end
      end

      context "index page content" do

        before(:each) do
          visit(dbd_onto_engine.ontologies_path)
        end

        it "shows the ontologies" do
          expect(page).to have_text('Ontologies')
        end

        it "shows the link to the context ontology" do
          expect(page).to have_link('Context', dbd_onto_engine.ontology_path(id: :context))
        end

        it "shows the link to the meta ontology" do
          expect(page).to have_text('Meta')
        end

        it "shows the link to the schema ontology" do
          expect(page).to have_text('Schema')
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

      context "meta page content" do

        before(:each) { visit dbd_onto_engine.ontology_path(id: 'meta') }

        it "shows the meta ontology" do
          expect(page).to have_text('Meta')
        end

        it "shows the meta:defines_predicate predicate" do
          expect(page).to have_text('meta:defines_predicate')
        end
      end

      context "context page content" do

        before(:each) { visit dbd_onto_engine.ontology_path(id: 'context') }

        it "shows the context ontology" do
          expect(page).to have_text('Context')
        end

        it "shows the context:visibility predicate" do
          expect(page).to have_text('context:visibility')
        end
      end

      context "schema page content" do

        before(:each) { visit dbd_onto_engine.ontology_path(id: 'schema') }

        it "shows the schema ontology" do
          expect(page).to have_css('h1', text: 'Ontology Schema')
        end

        it "shows an explanation for 'U'" do
          expect(page).to have_css('p', text: 'U stands for "used"')
        end

        it "shows the header 'U'" do
          expect(page).to have_css('th', text: /^U$/)
        end

        it "shows the header 'Predicate'" do
          expect(page).to have_css('th', text: 'Predicate')
        end

        it "shows the header 'Label'" do
          expect(page).to have_css('th', text: 'Label')
        end

        it "shows the header 'Comment'" do
          expect(page).to have_css('th', text: 'Comment')
        end

        it "shows a predicate that is used (V)" do
          expect(page).to have_css('td', text: /^V$/)
        end

        it "shows a predicate that is not used (-)" do
          expect(page).to have_css('td', text: /^\-$/)
        end

        it "shows the schema:about predicate" do
          expect(page).to have_css('td', text: 'schema:about')
        end

        it "shows the schema:about predicate as a link to the rdf:uri" do
          expect(page).to have_css('td a[href="http://schema.org/about"]', text: 'schema:about')
        end

        it "shows the label 'about'" do
          expect(page).to have_css('td', text: 'about')
        end

        it "shows the comment for 'schema:about'" do
          expect(page).to have_css('td', text: 'The subject matter of the content.')
        end
      end
    end
  end
end
