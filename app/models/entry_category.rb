# == Schema Information
#
# Table name: entry_categories
#
#  id          :uuid             not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class EntryCategory < ApplicationRecord
  # Includes

  # Attributes

  # Associations
  has_many :entries, dependent: :restrict_with_error

  # Delegates

  # Constants

  # Scopes

  # Callbacks

  # Validations
  validates :description, presence: true

  # Class methods

  # Instance Public methods

  private

  # Validations

  # Callbacks

  # Methods
end
