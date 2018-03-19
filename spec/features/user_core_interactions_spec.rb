require 'rails_helper'

describe "User core interactions", :type => :feature do
  before :each do
    @user = FactoryBot.create(:user)
    @bank_account = FactoryBot.create(:bank_account, user: @user)

    @second_user = FactoryBot.create(:user, email: 'test@test.com')
    @second_bank_account = FactoryBot.create(:bank_account, user: @second_user)
  end

  it "User is able to send money to another bank_account" do
    login_as(@user)
    visit "/"
    within("#new_bank_account") do
      fill_in 'Savings', with: '10'
      select "#{@second_user.email}", :from => "bank_account_id"
    end
    click_button 'Create Bank account'
    expect(page).to have_content "You\'ve just sent R$ 10.0 to #{@second_user.email}"
  end

  it "User is not able to send an amount bigger than what he has" do
    login_as(@user)
    visit "/"
    within("#new_bank_account") do
      fill_in 'Savings', with: '110'
      select "#{@second_user.email}", :from => "bank_account_id"
    end
    click_button 'Create Bank account'
    expect(page).to have_content "Not enough money on the source account"
  end

  it "User with bank_account is able to see its Balance" do
    login_as(@user)
    visit "/"
    click_link 'Show Balance'
    expect(page).to have_content "Your currency balace is R$ #{@user.bank_account.savings}"
  end

  it "New user without an account is not able to see its Balance" do
    user = FactoryBot.create(:user, email: 'newuser@email.com')
    login_as(user)
    visit "/"
    click_link 'Show Balance'
    expect(page).to have_content "You don not have a bank account yet!"
  end
end
