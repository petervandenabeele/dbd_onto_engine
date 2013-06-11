require 'spec_helper'

describe "dbd_onto_engine/ontologies/index.html.haml" do
  it "talks about ontologies" do
    render
    rendered.should match(/ontologies/i)
  end
end
