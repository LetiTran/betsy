class RemoveOrderIdFromOrderproducts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :orderproducts, :order, foreign_key: true
  end
end
