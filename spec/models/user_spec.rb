require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user)
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  # it { should have_many(:goals) }

  it "creates a password digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end
end
