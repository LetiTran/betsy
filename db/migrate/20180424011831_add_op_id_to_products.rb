class AddOpIdToProducts < ActiveRecord::Migration[5.1]
  def change
      add_reference :products, :orderproduct, foreign_key: true
  end
end
