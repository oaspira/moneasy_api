class MonthlyBudget::CreateMonthlyBudget
  include Callable
  attr_reader :yearly_budget, :user

  def initialize(yearly_budget)
    @user = yearly_budget.user
    @yearly_budget = yearly_budget
  end

  def call
    YearlyBudget::month_prefixes.keys.each do |month|
      MonthlyBudget.create!(
        year: yearly_budget.year,
        month: month,
        user_id: user.id,
        yearly_budget_id: yearly_budget.id
      )
    end
  end
end
