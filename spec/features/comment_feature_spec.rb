require "rails_helper"
require "spec_helper"

feature "creating comment on user" do
  before :each do
    sign_up("snob")
    sign_in("snob")
    visit user_url(User.find_by_username("snob"))
  end

  it "user can comment on theirself" do
    fill_in("Comment", with: "you're a snob")
    click_on "Submit"
    expect(page).to have_content("you're a snob")
  end
end


feature "creating comment on goal" do
  before :each do
    sign_up("snob")
    sign_in("snob")
    create_goal(User.find_by_username("snob"))
    visit goal_url(User.find_by_username("snob").goals.first)
  end

  it "user can comment on a goal" do
    fill_in("Comment", with: "you're a snob")
    click_on "Submit"
    expect(page).to have_content("you're a snob")
  end
end
