class Order < ApplicationRecord
  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :orderproducts
  has_many :products, through: :orderproducts

  validates :address, presence: true, length: { in: 1..35  }, if: :checking_out?
  validates :card_name, presence: true, length: { minimum: 1  }, if: :checking_out?
  validates :cc_number, presence: true, length: { is: 16 }, if: :checking_out?
  validates :cc_expiration, presence: true, if: :checking_out?
  validates :cvv, presence: true, length: { is: 3 }, if: :checking_out?
  validates :zip_code, presence: true, length: { is: 5 }, if: :checking_out?
  validates :email, presence: true,
  format: { with:  VALID_EMAIL },
  uniqueness: { case_sensitive: false }, if: :checking_out?

  def checking_out?
    :status == "paid"
  end

  def total
    total = 0
    self.orderproducts.each do |op|
      total += op.sub_total
    end

    return total
  end



end


# lass User < ApplicationRecord
#   with_options if: :is_admin? do |admin|
#     admin.validates :password, length: { minimum: 10 }
#     admin.validates :email, presence: true
#   end
# end
