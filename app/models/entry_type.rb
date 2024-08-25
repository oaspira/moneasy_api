# == Schema Information
#
# Table name: entry_types
#
#  id         :uuid             not null, primary key
#  key        :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_entry_types_on_key  (key) UNIQUE
#
class EntryType < ApplicationRecord
    # Includes
    include Translatable

    # Attributes

    # Associations
    has_many :entries, dependent: :restrict_with_error

    # Delegates

    # Constants
    KEYS = {
      profit: { pt: 'Lucro', en: 'Profit' },
      loss: { pt: 'Despesa', en: 'Loss' }
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
