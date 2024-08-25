class CreateMonthlyBudgets < ActiveRecord::Migration[7.2]
  def change
    create_table :monthly_budgets, id: :uuid do |t|
      t.integer :year, null: false
      t.string :month, null: false
      t.references :user, null: false, type: :uuid, foreign_key: true
      t.references :yearly_budget, null: false, type: :uuid, foreign_key: true

      t.timestamps
    end

    add_index :monthly_budgets, [:user_id, :yearly_budget_id, :year, :month], unique: true
  end
end
