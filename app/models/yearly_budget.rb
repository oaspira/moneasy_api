# == Schema Information
#
# Table name: yearly_budgets
#
#  id             :uuid             not null, primary key
#  month_prefixes :string
#  year           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :uuid             not null
#
# Indexes
#
#  index_yearly_budgets_on_user_id           (user_id)
#  index_yearly_budgets_on_user_id_and_year  (user_id,year) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class YearlyBudget < ApplicationRecord
  # Includes

  # Attributes

  # Associations
  belongs_to :user
  has_many :monthly_budgets, dependent: :restrict_with_error
  has_many :entries, dependent: :restrict_with_error

  # Delegates

  # Constants
  attribute :month_prefixes, :string, default: :jan
  enum month_prefixes: {
    jan: 'jan',
    feb: 'feb',
    mar: 'mar',
    apr: 'apr',
    may: 'may',
    jun: 'jun',
    jul: 'jul',
    aug: 'aug',
    sep: 'sep',
    oct: 'oct',
    nov: 'nov',
    dec: 'dec'
  }

  # Scopes

  # Callbacks

  # Validations
  validates :year, presence: true
  validates :year, numericality: { only_integer: true }, uniqueness: { scope: :user_id }
  validates :year, numericality: { greater_than_or_equal_to: 2000, less_than_or_equal_to: 10_000 }, on: [:create, :update]

  # Class methods

  # Instance Public methods

  private

  # Validations

  # Callbacks

  # Methods
end
