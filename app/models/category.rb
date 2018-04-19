class Category < ApplicationRecord
  has_many :products, through :categoryproduct

  validates :name, presence: true, uniqueness: true
end
