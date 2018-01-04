# require 'rails_helper'
#
# RSpec.describe "parts/index", type: :view do
#   before(:each) do
#     assign(:parts, [
#       Part.create!(
#         :name => "Name",
#         :section => "Section",
#         :text => "Text"
#       ),
#       Part.create!(
#         :name => "Name",
#         :section => "Section",
#         :text => "Text"
#       )
#     ])
#   end
#
#   it "renders a list of parts" do
#     render
#     assert_select "tr>td", :text => "Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Section".to_s, :count => 2
#     assert_select "tr>td", :text => "Text".to_s, :count => 2
#   end
# end
