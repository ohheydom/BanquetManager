module Commissions
  include CommissionsHelper
  extend ActiveSupport::Concern

  def positive_adjustments(args = {})
    extract_hosted = 'EXTRACT(MONTH FROM date_of_event) = ? AND EXTRACT(YEAR FROM date_of_event) = ?'
    extract_booked = 'EXTRACT(MONTH FROM date_booked) = ? AND EXTRACT(YEAR FROM date_booked) = ?'
    month = args[:month] == 'this_month' ? Date.today.month : Date.today.prev_month.month
    year = args[:month] == 'this_month' ? Date.today.year : Date.today.prev_month.year
    type = args[:type] == 'new_events' ? extract_booked : extract_hosted
    instance_variable_set("@#{args[:month]}_#{args[:type]}", clients.where(type, month, year))
  end

  def this_month_commission
    compute_commission_on_all(@this_month_new_events, @this_month_current)
  end

  def last_month_commission
    compute_commission_on_all(@last_month_new_events, @last_month_current)
  end
end
