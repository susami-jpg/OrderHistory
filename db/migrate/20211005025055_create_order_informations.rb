class CreateOrderInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :order_informations do |t|
      t.string :name
      t.string :maker
      t.string :catalog_id
      t.string :supplier
      t.boolean :delivered
      t.date :delivered_at

      t.timestamps
    end
  end
end
