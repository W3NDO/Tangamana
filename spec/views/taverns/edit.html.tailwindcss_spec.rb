require 'rails_helper'

RSpec.describe "taverns/edit", type: :view do
  before(:each) do
    @tavern = assign(:tavern, Tavern.create!(
      name: "MyString",
      topic: "MyString",
      user_id: 1
    ))
  end

  it "renders the edit tavern form" do
    render

    assert_select "form[action=?][method=?]", tavern_path(@tavern), "post" do

      assert_select "input[name=?]", "tavern[name]"

      assert_select "input[name=?]", "tavern[topic]"

      assert_select "input[name=?]", "tavern[user_id]"
    end
  end
end
