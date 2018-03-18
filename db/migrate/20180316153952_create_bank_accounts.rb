class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.float :savings
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
