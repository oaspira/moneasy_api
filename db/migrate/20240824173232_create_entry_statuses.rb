class CreateEntryStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :entry_statuses, id: :uuid do |t|
      t.string :key, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :entry_statuses, :key, unique: true
  end
end
