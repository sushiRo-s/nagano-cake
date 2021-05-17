class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :member_id
      t.string :name
      t.string :address
      t.string :postcode
      t.timestamps
    end
  end
end
