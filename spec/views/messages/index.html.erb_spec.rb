require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :text => "Text",
        :recipient => "Recipient",
        :report => nil,
        :message_category => 2
      ),
      Message.create!(
        :text => "Text",
        :recipient => "Recipient",
        :report => nil,
        :message_category => 2
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Recipient".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
