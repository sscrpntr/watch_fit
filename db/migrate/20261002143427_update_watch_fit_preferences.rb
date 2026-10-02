class UpdateWatchFitPreferences < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :style_preferences, :string, array: true, default: [], null: false
    add_column :users, :bracelet_preferences, :string, array: true, default: [], null: false

    add_column :watches, :styles, :string, array: true, default: [], null: false
    add_column :watches, :bracelet_types, :string, array: true, default: [], null: false
  end
end
