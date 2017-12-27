require 'rails_helper'

RSpec.describe "parts/new", type: :view do
  before(:each) do
    assign(:part, Part.new(
      :name => "MyString",
      :section => "MyString",
      :text => "MyString"
    ))
  end

  it "renders new part form" do
    render

    assert_select "form[action=?][method=?]", parts_path, "post" do

      assert_select "input[name=?]", "part[name]"

      assert_select "input[name=?]", "part[section]"

      assert_select "input[name=?]", "part[text]"
    end
  end
end
