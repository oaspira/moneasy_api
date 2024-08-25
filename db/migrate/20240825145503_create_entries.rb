class CreateEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :entries, id: :uuid do |t|
      t.string :description, null: false
      t.decimal :value, null: false, precision: 15, scale: 2
      t.datetime :due_date
      t.references :entry_type, null: false
      t.references :user, null: false
      t.references :entry_category
      t.references :monthly_budget, null: false
      t.references :yearly_budget, null: false
      t.references :entry_status, null: false

      t.timestamps
    end
  end

end
