# == Schema Information
#
# Table name: monthly_budgets
#
#  id               :uuid             not null, primary key
#  month            :string           not null
#  year             :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :uuid             not null
#  yearly_budget_id :uuid             not null
#
# Indexes
#
#  idx_on_user_id_yearly_budget_id_year_month_6f6a90a555  (user_id,yearly_budget_id,year,month) UNIQUE
#  index_monthly_budgets_on_user_id                       (user_id)
#  index_monthly_budgets_on_yearly_budget_id              (yearly_budget_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (yearly_budget_id => yearly_budgets.id)
#
class MonthlyBudget < ApplicationRecord
  # Includes

  # Attributes

  # Associations
  belongs_to :user
  belongs_to :yearly_budget

  has_many :entries, dependent: :restrict_with_error

  # Delegates

  # Constants

  # Scopes

  # Callbacks

  # Validations
  validates :year, presence: true
  validates :year, numericality: { only_integer: true }, uniqueness: { scope: [:user_id, :yearly_budget_id, :month] }
  validates :year, numericality: { greater_than_or_equal_to: 2000, less_than_or_equal_to: 10_000 }, on: [:create, :update]

  # Class methods

  # Instance Public methods

  private

  # Validations

  # Callbacks

  # Methods
end
