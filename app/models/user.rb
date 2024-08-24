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
  include PgSearch::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Constants

  # Associations

  # Delegates

  # Validations

  # Callbacks

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

  # Methods
end
