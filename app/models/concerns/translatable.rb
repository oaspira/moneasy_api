# app/models/concerns/statusable.rb
module Translatable
  extend ActiveSupport::Concern

  included do
    after_initialize :init, if: :new_record?
  end

  def translated_name(locale = I18n.locale)
    self.class::KEYS[key.to_sym][locale] || key
  end

  private

  def init
    self.name ||= translated_name
  end
end
