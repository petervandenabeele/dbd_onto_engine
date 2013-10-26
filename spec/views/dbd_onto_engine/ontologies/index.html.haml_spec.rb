require 'spec_helper'

describe "dbd_onto_engine/ontologies/index.html.haml" do
  it "talks about ontologies" do
    render
    rendered.should match(/ontologies/i)
  end

  it 'renders the links partial' do
    render.should render_template('dbd_onto_engine/shared/_links')
  end
end
