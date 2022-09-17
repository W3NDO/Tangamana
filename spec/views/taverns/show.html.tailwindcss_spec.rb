require 'rails_helper'

RSpec.describe "taverns/show", type: :view do
  before(:each) do
    @tavern = assign(:tavern, Tavern.create!(
      name: "Name",
      topic: "Topic",
      user_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Topic/)
    expect(rendered).to match(/2/)
  end
end
