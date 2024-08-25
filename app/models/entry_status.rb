# == Schema Information
#
# Table name: entry_statuses
#
#  id         :uuid             not null, primary key
#  key        :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_entry_statuses_on_key  (key) UNIQUE
#
class EntryStatus < ApplicationRecord
  # Includes
  include Translatable

  # Attributes

  # Associations
  has_many :entries, dependent: :restrict_with_error

  # Delegates

  # Constants
  KEYS = {
    pending: { pt: 'Pendente', en: 'Pending' },
    paid: { pt: 'Pago', en: 'Paid' },
    overdue: { pt: 'Atrasado', en: 'Overdue' }
  }.freeze

  # Scopes

  # Callbacks

  # Validations
  validates :key, presence: true, inclusion: { in: KEYS.keys.map(&:to_s) }, uniqueness: true
  validates :name, presence: true

  # Class methods

  # Instance Public methods

  private

  # Validations

  # Callbacks

  # Methods
end
