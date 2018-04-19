class Order < ApplicationRecord
  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_and_belongs_to_many :products, through: :orderproduct

  validates :address, presence: true, length: { in: 1..35  }
  validates :card_name, presence: true, length: { minimum: 1  }
  validates :cc_number, presence: true, length: { is: 16 }
  validates :cc_expiration, presence: true
  validates :cvv, presence: true, length: { is: 3 }
  validates :zip_code, presence: true, length: { is: 5 }
  validates :email, presence: true,
  format: { with:  VALID_EMAIL },
  uniqueness: { case_sensitive: false }
end
