module CommissionsHelper
  COMMISSION_RATE = '.04'.to_f
  BREAKAGE_RATE = '1.18'.to_f #leave at 1 if no amount is deducted from commission based on antiquated clauses
  def compute_commission_on_new_party(party)
    comm =  (party.minimum_guarantee*party.base_price)*COMMISSION_RATE/BREAKAGE_RATE
    comm.round(2)
  end
  
  def compute_commission_on_positive_adjustment(party)
    party.additional_charges.nil? ? additional_charges = 0 : additional_charges = party.additional_charges
    comm =  ((additional_charges+((party.amount_of_guests-party.minimum_guarantee)*party.base_price))*COMMISSION_RATE)/BREAKAGE_RATE
    comm.round(2)
  end

  def compute_commission_on_all(new_events, month_events)
    amount = 0
    new_events.each do |event|
    amount+= compute_commission_on_new_party(event)
    end
    month_events.each do |event|
    amount+= compute_commission_on_positive_adjustment(event)
    end
    return amount
  end

end
