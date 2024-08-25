# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include
  include Searchable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Constants

  # Associations
  has_many :yearly_budgets
  has_many :monthly_budgets, dependent: :restrict_with_error
  has_many :entries, dependent: :restrict_with_error

  # Delegates

  # Validations

  # Callbacks
  after_create :create_yearly_budget

  # Scopes
  pg_search_scope :pg_search,
    against: [:first_name, :last_name],
    using: {
      tsearch: { prefix: true } # Enable partial matching
    }

  # Class Methods

  # Instance Methods

  private

  # Validations

  # Callbacks
  def create_yearly_budget
    YearlyBudget::CreateYearlyBudget.call(self)
  end

  # Methods
end
