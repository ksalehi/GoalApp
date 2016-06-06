ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

end

def sign_up(username)
  visit "/users/new"
  fill_in "Username", with: username
  fill_in "Password", with: "password123"
  click_button "Sign Up"
end

def sign_in(username)
  visit "/session/new"
  fill_in "Username", with: username
  fill_in "Password", with: "password123"
  click_button "Sign In"
end

def create_goal(user)
  visit user_url(user)
  fill_in "Title", with: "Faker::Hipster.sentence"
  fill_in "Description", with: Faker::Hipster.sentence
  click_on "Add Goal"
end
