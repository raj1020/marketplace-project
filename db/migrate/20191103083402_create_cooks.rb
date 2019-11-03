class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string :street_address
      t.string :suburb
      t.string :postcode
      t.string :state

      t.timestamps
    end
  end
end
