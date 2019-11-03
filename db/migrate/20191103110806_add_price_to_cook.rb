class AddPriceToCook < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :price, :integer
  end
end
