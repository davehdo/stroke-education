require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :text => "MyString",
      :recipient => "MyString",
      :report => nil,
      :message_category => 1
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input[name=?]", "message[text]"

      assert_select "input[name=?]", "message[recipient]"

      assert_select "input[name=?]", "message[report_id]"

      assert_select "input[name=?]", "message[message_category]"
    end
  end
end
