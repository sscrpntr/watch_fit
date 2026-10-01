class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.decimal :wrist_circumference
      t.string :size_preference
      t.string :style_preference
      t.decimal :budget
      t.string :bracelet_preference

      t.timestamps
    end
  end
end
