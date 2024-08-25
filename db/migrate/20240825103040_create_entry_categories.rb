class CreateEntryCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :entry_categories, id: :uuid do |t|
      t.string :description, null: false

      t.timestamps
    end

    # add_index :entry_categories, :key, unique: true
  end
end
