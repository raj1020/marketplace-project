class AddUserToCook < ActiveRecord::Migration[5.2]
  def change
    add_reference :cooks, :user, foreign_key: true
  end
end
