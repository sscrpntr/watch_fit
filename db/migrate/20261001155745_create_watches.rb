class CreateWatches < ActiveRecord::Migration[8.1]
  def change
    create_table :watches do |t|
      t.string :brand
      t.string :model
      t.string :reference
      t.decimal :diameter
      t.decimal :lug_to_lug
      t.decimal :thickness
      t.string :watch_type
      t.decimal :price

      t.timestamps
    end
  end
end
