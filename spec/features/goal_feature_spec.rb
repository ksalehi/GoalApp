require 'rails_helper'
require 'spec_helper'

feature "adding a goal" do
  #let(:hipster) { FactoryGirl.create(:user) }

  before :each do
    sign_up("hipster")
    sign_in("hipster")
    visit user_url(User.find_by_username("hipster"))
  end

  it "user homepage has 'Add Goal' button" do
    expect(page).to have_content("Add Goal")
  end

  it "Shows add goal form on user page" do
    expect(page).to have_content("Add Goal")
    expect(page).to have_content("Title")
    expect(page).to have_content("Description")
  end

  it "adds a goal if params are valid" do
    fill_in("Title", with: "Be hipster")
    fill_in("Description", with: Faker::Hipster.sentence)
    click_on("Add Goal")
    expect(page).to have_content("Be hipster")
  end

  it "re-renders new goal page with errors on invalid params" do
    fill_in("Description", with: Faker::Hipster.sentence)
    click_on("Add Goal")
    expect(page).to have_content("Title can't be blank")
  end
end

feature "editing a goal" do
  before :each do
    sign_up("hipster")
    sign_in("hipster")
    create_goal(User.find_by_username("hipster"))
  end

  it "can mark goal as completed" do
    click_on "Update Goal"
    choose('Completed')
    click_on "Update Goal"
    expect(page).to have_content("Completed!")
  end

  it "auto-fills fields with existing data" do
    click_on "Update Goal"
    expect(page).to have_content(User.find_by_username("hipster").goals.first.description)
  end
end
