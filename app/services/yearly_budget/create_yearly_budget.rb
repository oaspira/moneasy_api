class YearlyBudget::CreateYearlyBudget
  include Callable
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    YearlyBudget.create!(user_id: user.id, year: Date.current.year)
  end
end
