require 'rails_helper'

RSpec.describe "taverns/new", type: :view do
  before(:each) do
    assign(:tavern, Tavern.new(
      name: "MyString",
      topic: "MyString",
      user_id: 1
    ))
  end

  it "renders new tavern form" do
    render

    assert_select "form[action=?][method=?]", taverns_path, "post" do

      assert_select "input[name=?]", "tavern[name]"

      assert_select "input[name=?]", "tavern[topic]"

      assert_select "input[name=?]", "tavern[user_id]"
    end
  end
end
