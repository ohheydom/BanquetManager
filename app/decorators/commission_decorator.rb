class CommissionDecorator < ApplicationDecorator
  delegate_all
  decorates_association :new_events_this_month, with: CommissionDecorator
  decorates_association :current_events_this_month, with: CommissionDecorator
  decorates_association :new_events_last_month, with: CommissionDecorator
  decorates_association :current_events_last_month, with: CommissionDecorator

  COMMISSION_RATE = '.04'.to_f
  BREAKAGE_RATE = '1.18'.to_f # leave at 1 if no amount is deducted from commission

  def positive_adjustment_commission
    additional_charges = object.additional_charges.nil? ? 0 : object.additional_charges
    comm =  ((additional_charges + ((object.amount_of_guests - object.minimum_guarantee) * object.base_price)) * COMMISSION_RATE) / BREAKAGE_RATE
    h.number_to_currency comm.round(2)
  end

  def new_party_commission
    comm = (object.minimum_guarantee * object.base_price) * COMMISSION_RATE / BREAKAGE_RATE
    h.number_to_currency comm.round(2)
  end

  def edit_event_link
    h.link_to object.name, h.edit_client_path(object)
  end
end
