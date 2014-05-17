class CommissionCalculator
  def initialize(user)
    @user = user
  end

  def new_events_this_month
    @user.positive_adjustments(type: 'new_events', month: 'this_month')
  end

  def current_events_this_month
    @user.positive_adjustments(type: 'current', month: 'this_month')
  end

  def new_events_last_month
    @user.positive_adjustments(type: 'new_events', month: 'last_month')
  end

  def current_events_last_month
    @user.positive_adjustments(type: 'current', month: 'last_month')
  end
end
