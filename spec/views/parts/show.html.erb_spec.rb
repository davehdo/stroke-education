require 'rails_helper'

RSpec.describe "parts/show", type: :view do
  before(:each) do
    @part = assign(:part, Part.create!(
      :name => "Name",
      :section => "Section",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Section/)
    expect(rendered).to match(/Text/)
  end
end
