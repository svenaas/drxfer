require 'rails_helper'

describe "home/index.html.erb" do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @user.agreements.create(name: "Name").transfers.create(description: "Text")
  end

  it "renders a list of transfers" do
    render
    expect(rendered).to include("Name")
  end
end
