module TodolistsHelper
  def six_week_start_dates
    current_date = find_previous_tuesday(Date.today.strftime("%D"))
    (1..5).to_a.each_with_object([current_date]) { |x, obj| obj << current_date + (x * 7) }
  end

  def find_previous_tuesday(date)
    current_date = DateTime.strptime(date, "%D")
    case current_date.wday
    when 2..6
      current_date - (current_date.wday - 2)
    when 0
      current_date - 5
    when 1
      current_date + 1
    end
  end

  def date_span(date)
    "#{date.strftime("%D")} - #{(date+5).strftime("%D")}"
  end
end
