class Api::V1::MonthlyBudgetsController < ApplicationController
  before_action :set_monthly_budget, only: %i[totals]

  def totals
    @total = @monthly_budget.monthly_sum
  end

  private

  def set_monthly_budget
    monthly_budget = MonthlyBudget.find_by(id: params[:id])
    return render json: { errors: t('activerecord.errors.messages.item_not_found') }, status: :not_found unless monthly_budget

    # authorize MonthlyBudget
    @monthly_budget = monthly_budget
  end
end
