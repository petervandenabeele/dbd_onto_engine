require 'spec_helper'

describe "dbd_onto_engine/ontologies/show.html.haml" do

  before(:each) do
    @ontology = 'foo'
  end

  it "talks about an ontology" do
    render
    rendered.should have_css('h1', text: 'Ontology Foo')
  end

  it "explains U" do
    render
    rendered.should have_css('p', text: 'U stands for "used to create new resources"')
  end

  it 'renders the links partial' do
    render.should render_template('dbd_onto_engine/shared/_links')
  end
end
