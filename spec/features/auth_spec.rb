require 'spec_helper'
require 'rails_helper'

feature "the sign-up process" do
  before :each do
    visit "/users/new"
  end

  it "has a sign up page" do
    expect(page).to have_content "Sign Up"
  end

  it "has username and password fields" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  it "logs in the user and redirects to user's profile if successful" do
    fill_in "Username", with: "ben_wishaw"
    fill_in "Password", with: "qqqqqq"
    click_on "Sign Up"
    expect(page).to have_content "ben_wishaw"
    expect(current_url).to eq(user_url(User.find_by_username("ben_wishaw")))
  end

  it "re-renders sign-up on failed sign-up" do
    fill_in "Username", with: "ben_wishaw"
    fill_in "Password", with: "q"
    click_on "Sign Up"
    expect(page).to have_content("Password is too short")
  end
end

feature "the sign-in process" do
  before :each do
    visit "/session/new"
  end

  it "has a sign in page" do
    expect(page).to have_content("Sign In")
  end

  it "has username and password fields" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  it "logs in the user and redirects to user's profile if successful" do
    sign_up("megatron")
    sign_in("megatron")
    expect(current_url).to eq(user_url(User.find_by_username("megatron")))
  end
end

feature "signing out" do
  before :each do
    sign_up("megatron")
    sign_in("megatron")
  end

  it "logs out user" do
    click_on "Sign Out"
    expect(page).to_not have_content("megatron")
  end

  it "does not delete user from db" do
    click_on "Sign Out"
    expect(User.find_by_username("megatron")).to be_truthy
  end
end
