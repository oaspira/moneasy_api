class CreateEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :entries, id: :uuid do |t|
      t.string :description, null: false
      t.decimal :value, null: false, precision: 15, scale: 2
      t.datetime :due_date
      t.references :entry_type, null: false, type: :uuid, foreign_key: true
      t.references :user, null: false, type: :uuid, foreign_key: true
      t.references :entry_category, type: :uuid, foreign_key: true
      t.references :monthly_budget, null: false, type: :uuid, foreign_key: true
      t.references :yearly_budget, null: false, type: :uuid, foreign_key: true
      t.references :entry_status, null: false, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
