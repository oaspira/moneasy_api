# frozen_string_literal: true

class EntryStatusPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
