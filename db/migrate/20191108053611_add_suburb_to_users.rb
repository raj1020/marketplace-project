class AddSuburbToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :suburb, :string
  end
end
