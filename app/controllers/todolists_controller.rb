class TodolistsController < ApplicationController
  helper_method :find_prev_tuesday
  before_filter :authenticate_user!

  def show
    @clients = User.find(current_user.id).clients.future
    @dates = create_arr_of_six_week_start_dates
  end

  def create_arr_of_six_week_start_dates
    current_date = find_prev_tuesday(Date.today.strftime("%D"))
    (1..5).to_a.each_with_object([current_date]) { |x, obj| obj << current_date + (x * 7) }
  end

  def find_prev_tuesday(date)
    current_date = DateTime.strptime(date, "%D")
    tuesday_date = case current_date.wday
    when 2..6
      current_date - (current_date.wday - 2)
    when 0
      current_date - 5
    when 1
      current_date + 1
    end
  end
end
