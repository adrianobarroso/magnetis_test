class BankAccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.bank_account.nil?
      redirect_to new_bank_account_path
    else
      @bank_accounts = BankAccount.all
    end
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_strong)
    @bank_account.user = current_user
    if @bank_account.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def transfer_money
    savings = transfer_money_strong['savings'].to_f
    bank = BankAccount.find(transfer_money_strong['id'].to_i)
    response = current_user.bank_account.transfer_money(bank, savings)
    if response == true
      flash[:notice] = "You've just sent R$ #{savings} to #{bank.user.email}"
    else
      flash[:alert] = response.first
    end
    redirect_to root_path
  end

  def currency_balance
    if current_user.bank_account.nil?
      flash[:alert] = "You don not have a bank account yet!"
    else
      flash[:notice] = "Your currency balace is R$ #{current_user.bank_account.savings}"
    end
    redirect_to request.referer
  end

  private

  def bank_account_strong
    params.require(:bank_account).permit(:savings)
  end

  def transfer_money_strong
    params.require(:bank_account).permit(:savings, :id)
  end
end
