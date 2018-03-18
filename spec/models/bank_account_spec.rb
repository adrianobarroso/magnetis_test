require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it "should not be able to create BankAccount without user" do
    bank_account = FactoryBot.build(:bank_account)
    expect(bank_account).to_not be_valid
  end

  it "should create BankAccount for a user" do
    bank_account = FactoryBot.create(:bank_account, user: @user)
    expect(@user.bank_account).to eq(bank_account)
  end

  it "should not create BankAccount for a user when savings is negative" do
    bank_account = FactoryBot.build(:bank_account, savings: -1, user: @user)
    expect(bank_account).to_not be_valid
  end

  it "should be able to deposit money on bank_account" do
    bank_account = FactoryBot.create(:bank_account, user: @user)
    new_user = FactoryBot.create(:user, email: 'test@mail.com')
    new_bank_account = FactoryBot.create(:bank_account, savings: 1000, user: new_user)
    new_bank_account.transfer_money(bank_account, 100)
    expect(bank_account.savings).to eq(200)
  end

  it "should not be able to deposit money on bank_account if the amount is bigger than savings" do
    bank_account = FactoryBot.create(:bank_account, user: @user)
    new_user = FactoryBot.create(:user, email: 'test@mail.com')
    new_bank_account = FactoryBot.create(:bank_account, savings: 100, user: new_user)
    new_bank_account.transfer_money(bank_account, 1000)
    expect(new_bank_account.errors.messages).to have_key(:not_enough_savings)
  end
end
