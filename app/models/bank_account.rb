class BankAccount < ApplicationRecord
  belongs_to :user

  validates :user, uniqueness: true
  validates :savings, presence: true

  validates :savings, numericality: { greater_than: 0 }

  def transfer_money(bank_account, amount)
    if savings >= amount
      bank_account.update(savings: bank_account.savings += amount)
      update(savings: self.savings -= amount)
    else
      errors.add(:not_enough_savings, "Not enough money on the source account")
    end
  end
end
