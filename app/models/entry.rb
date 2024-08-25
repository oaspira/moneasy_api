# == Schema Information
#
# Table name: entries
#
#  id                :uuid             not null, primary key
#  description       :string           not null
#  due_date          :datetime
#  value             :decimal(15, 2)   not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  entry_category_id :bigint
#  entry_status_id   :bigint           not null
#  entry_type_id     :bigint           not null
#  monthly_budget_id :bigint           not null
#  user_id           :bigint           not null
#  yearly_budget_id  :bigint           not null
#
# Indexes
#
#  index_entries_on_entry_category_id  (entry_category_id)
#  index_entries_on_entry_status_id    (entry_status_id)
#  index_entries_on_entry_type_id      (entry_type_id)
#  index_entries_on_monthly_budget_id  (monthly_budget_id)
#  index_entries_on_user_id            (user_id)
#  index_entries_on_yearly_budget_id   (yearly_budget_id)
#
class Entry < ApplicationRecord
  # Includes

  # Attributes

  # Associations
  belongs_to :entry_type
  belongs_to :user
  belongs_to :entry_category
  belongs_to :monthly_budget
  belongs_to :yearly_budget
  belongs_to :entry_status

  # Delegates

  # Constants

  # Scopes

  # Callbacks

  # Validations
  # validates :year, presence: true
  # validates :year, numericality: { only_integer: true }, uniqueness: { scope: [:user_id, :yearly_budget_id, :month] }
  # validates :year, numericality: { greater_than_or_equal_to: 2000, less_than_or_equal_to: 10_000 }, on: [:create, :update]

  # Class methods

  # Instance Public methods

  private

  # Validations

  # Callbacks

  # Methods
end
