class CreateYearlyBudgets < ActiveRecord::Migration[7.2]
  def change
    create_table :yearly_budgets, id: :uuid do |t|
      t.integer :year, null: false
      t.references :user, null: false, type: :uuid, foreign_key: true
      t.string :month_prefixes

      t.timestamps
    end

    add_index :yearly_budgets, [:user_id, :year], unique: true
  end
end
