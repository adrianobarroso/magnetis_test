require 'rails_helper'

RSpec.describe User, type: :model do
  it "should authenticate user" do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  it "should have uniqueness email" do
    FactoryBot.create(:user)
    second_user = FactoryBot.build(:user, email: 'test@magnetis.com')
    expect(second_user).to_not be_valid
  end
end
