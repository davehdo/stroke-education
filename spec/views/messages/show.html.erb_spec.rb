require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :text => "Text",
      :recipient => "Recipient",
      :report => nil,
      :message_category => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/Recipient/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
