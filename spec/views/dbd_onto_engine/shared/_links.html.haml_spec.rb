require 'spec_helper'

describe 'dbd_onto_engine/shared/_links.html.haml' do

  before(:each) do
    render 'dbd_onto_engine/shared/links'
  end

  it 'renders the link to ontologies' do
    rendered.should have_css('a[href="/ontologies"]', text: 'ontologies')
  end

  it 'renders the link to resources' do
    rendered.should have_css('a[href="/data/resources"]', text: 'resources')
  end

  it 'renders the link to contexts' do
    rendered.should have_css('a[href="/data/contexts"]', text: 'contexts')
  end
end
