class Order < ApplicationRecord
  VALID_EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :orderproducts
  has_many :products, through: :orderproducts

  with_options if: :checking_out? do |order|
    validates :address, presence: true, length: { in: 1..35  }
    validates :card_name, presence: true, length: { minimum: 1  }
    validates :cc_number, presence: true, length: { is: 16 }
    validates :cc_expiration, presence: true
    # TODO: the date should be grater than today
    validates :cvv, presence: true, length: { is: 3 }
    validates :zip_code, presence: true, length: { is: 5 }
    validates :email, presence: true,
    format: { with:  VALID_EMAIL },
    uniqueness: { case_sensitive: false }
   end

  def checking_out?
    :status == "open"
  end

  def total
    total = 0
    self.orderproducts.each do |op|
      total += op.sub_total
    end
    return total
  end

  def change_status
    self.status == "paid" ? self.status = "canceled" : self.status = "paid"
    self.save
  end

end
