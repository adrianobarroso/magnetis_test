require 'rails_helper'

describe "User the signin process", :type => :feature do
  before :each do
    FactoryBot.create(:user)
  end

  it "log in user" do
    visit '/'
    within("#new_user") do
      fill_in 'Email', with: 'test@magnetis.com'
      fill_in 'Password', with: 'spec123'
    end
    click_button 'Log in'
    expect(page).to have_content 'Log out'
  end

  it "when log in new user should redirect to new bank_account page" do
    visit '/'
    within("#new_user") do
      fill_in 'Email', with: 'test@magnetis.com'
      fill_in 'Password', with: 'spec123'
    end
    click_button 'Log in'
    expect(page).to have_content 'Create your bank account'
  end
end
