class Api::V1::MonthlyBudgetsController < ApplicationController
  before_action :set_monthly_budget, only: %i[totals]
  before_action :set_monthly_budgets, only: %i[dashboard]
  before_action :set_types, only: %i[dashboard]

  def dashboard
    current_profit = @monthly_budget&.sum_by_type(@profit).to_f
    latest_profit = @latest_monthly_budget&.sum_by_type(@profit).to_f
    current_loss = @monthly_budget&.sum_by_type(@loss).to_f
    latest_loss = @latest_monthly_budget&.sum_by_type(@loss).to_f
    current_balance = current_profit.to_f - current_loss.to_f
    latest_balance = latest_profit.to_f - latest_loss.to_f

    @current_profit = monetize_value(current_profit)
    @latest_profit = monetize_value(latest_profit)
    @current_loss = monetize_value(current_loss)
    @latest_loss = monetize_value(latest_loss)
    @current_balance = monetize_value(current_balance)
    @latest_balance = monetize_value(latest_balance)
  end

  def totals
    @total = @monthly_budget.monthly_sum
  end

  private

  def set_monthly_budgets
    current_reference_year = params[:reference_year]&.to_i
    latest_reference_year = params[:reference_year]&.to_i - 1
    reference_month = params[:reference_month]

    monthly_budget = MonthlyBudget.find_by(year: current_reference_year, month: reference_month)
    latest_monthly_budget = MonthlyBudget.find_by(year: latest_reference_year, month: reference_month)
    return render json: { errors: t('activerecord.errors.messages.item_not_found') }, status: :not_found unless monthly_budget

    @monthly_budget = monthly_budget
    @latest_monthly_budget = latest_monthly_budget
  end

  def set_types
    @profit = EntryType.find_by(key: 'profit')
    @loss = EntryType.find_by(key: 'loss')
  end

  def monetize_value(value)
    money = Money.new(value, 'USD')
    formatted_value = money.format(symbol: false, symbol_position: :before, decimal_mark: ',', thousands_separator: '.')
    "#{money.symbol} #{formatted_value}"
  end
end
