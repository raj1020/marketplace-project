class AddCookingTimeToCook < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :cooking_time, :integer
  end
end
