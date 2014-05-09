module CommissionsHelper
  COMMISSION_RATE = '.04'.to_f
  BREAKAGE_RATE = '1.18'.to_f # leave at 1 if no amount is deducted from commission

  def positive_adjustment_commission(event)
    additional_charges = event.additional_charges.nil? ? 0 : event.additional_charges
    comm =  ((additional_charges + ((event.amount_of_guests - event.minimum_guarantee) * event.base_price)) * COMMISSION_RATE) / BREAKAGE_RATE
    comm.round(2)
  end

  def new_party_commission(event)
    comm = (event.minimum_guarantee * event.base_price) * COMMISSION_RATE / BREAKAGE_RATE
    comm.round(2)
  end

  def compute_commission_on_all(new_events, month_events)
    amount = 0
    new_events.each { |event| amount += new_party_commission(event) }
    month_events.each { |event| amount += positive_adjustment_commission(event) }
    amount
  end
end
