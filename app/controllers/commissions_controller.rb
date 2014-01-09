class CommissionsController < ApplicationController
  def commissions
    today = Date.today
    @positive_adjustments_this_month = Client.where("EXTRACT(MONTH FROM date_of_event) = ? AND EXTRACT(YEAR FROM date_of_event) = ?", today.month, today.year)
    @new_parties_this_month = Client.where("EXTRACT(MONTH FROM date_booked) = ? AND EXTRACT(YEAR FROM date_booked) = ?", today.month, today.year)

    @positive_adjustments_prev_month = Client.where("EXTRACT(MONTH FROM date_of_event) = ? AND EXTRACT(YEAR FROM date_of_event) = ?", today.prev_month.month, today.prev_month.year)
    @new_parties_prev_month = Client.where("EXTRACT(MONTH FROM date_booked) = ? AND EXTRACT(YEAR FROM date_booked) = ?", today.prev_month.month, today.prev_month.year)

  end

end
