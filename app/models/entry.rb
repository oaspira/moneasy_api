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
#  entry_category_id :uuid
#  entry_status_id   :uuid             not null
#  entry_type_id     :uuid             not null
#  monthly_budget_id :uuid             not null
#  user_id           :uuid             not null
#  yearly_budget_id  :uuid             not null
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
# Foreign Keys
#
#  fk_rails_...  (entry_category_id => entry_categories.id)
#  fk_rails_...  (entry_status_id => entry_statuses.id)
#  fk_rails_...  (entry_type_id => entry_types.id)
#  fk_rails_...  (monthly_budget_id => monthly_budgets.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (yearly_budget_id => yearly_budgets.id)
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
  with_options prefix: true do
    delegate :name, to: :entry_type, allow_nil: true
    delegate :first_name, to: :user, allow_nil: true
    delegate :last_name, to: :user, allow_nil: true
    delegate :name, to: :entry_status, allow_nil: true
  end

  # Constants

  # Scopes
  scope :for_entry_type, ->(entry_type) { where(entry_type:) }
  scope :for_user, ->(user) { where(user:) }
  scope :for_entry_category, ->(entry_category) { where(entry_category:) }
  scope :for_monthly_budget, ->(monthly_budget) { where(monthly_budget:) }
  scope :for_yearly_budget, ->(yearly_budget) { where(yearly_budget:) }
  scope :for_entry_status, ->(entry_status) { where(entry_status:) }

  # Callbacks

  # Validations

  # Class methods

  # Instance Public methods

  private

  # Validations

  # Callbacks

  # Methods
end
