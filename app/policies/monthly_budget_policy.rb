# frozen_string_literal: true

class MonthlyBudgetPolicy < ApplicationPolicy
  def totals?
    true
  end
end
