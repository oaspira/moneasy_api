class CreateEntryTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :entry_types do |t|
      t.string :key, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :entry_types, :key, unique: true
  end
end
