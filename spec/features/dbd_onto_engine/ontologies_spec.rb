require 'spec_helper'

module DbdOntoEngine
  describe "Ontologies" do
    describe "GET /ontologies" do
      it "shows the ontologies" do
        visit dbd_onto_engine.root_path
        expect(page).to have_text('ontologies')
      end
    end
  end
end
