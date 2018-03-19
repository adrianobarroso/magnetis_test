Rails.application.routes.draw do

  devise_for :users
  root 'bank_accounts#index'

  resources :bank_accounts, only: [:index, :new, :create] do
    collection do
      post 'transfer_money'
      get 'currency_balance'
    end
  end
end
