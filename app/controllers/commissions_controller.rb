class CommissionsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @commissions = CommissionDecorator.decorate(CommissionCalculator.new(current_user))
  end
end
