require 'rails_helper'

RSpec.describe "reports/show", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :key => "Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Key/)
  end
end
