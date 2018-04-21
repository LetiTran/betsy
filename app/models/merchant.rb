class Merchant < ApplicationRecord
  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :products
  

  validates :username, presence: true,
                      length: { :minimum => 0 },
                      uniqueness: true
  validates :email, presence: true,
                    format: { with:  VALID_EMAIL },
                    uniqueness: { case_sensitive: false }
end
