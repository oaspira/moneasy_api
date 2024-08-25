module Searchable
  extend ActiveSupport::Concern

  included do
    include PgSearch::Model

    scope :search, ->(value) { pg_search(value) if value.present? }
  end
end
