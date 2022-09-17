require 'rails_helper'

RSpec.describe "taverns/index", type: :view do
  before(:each) do
    assign(:taverns, [
      Tavern.create!(
        name: "Name",
        topic: "Topic",
        user_id: 2
      ),
      Tavern.create!(
        name: "Name",
        topic: "Topic",
        user_id: 2
      )
    ])
  end

  it "renders a list of taverns" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Topic".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
