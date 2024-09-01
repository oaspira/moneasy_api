# frozen_string_literal: true

class EntryTypePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
