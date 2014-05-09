module ClientValidations
  extend ActiveSupport::Concern

  included do
    validates :name, :guests_of_honor, :type_of_event, :minimum_guarantee,
              :amount_of_guests, :base_price, :deposit, presence: true
    validates :minimum_guarantee, :amount_of_guests, :phone_number,
              :base_price, :additional_charges, :deposit, numericality: true

    validates_date :payment_2_date, on_or_after: :payment_1_date
    validates_date :payment_1_date, :menu, :payment_2_date, :date_of_event,
                   :final_payment_date, on_or_after: :date_booked
  end
end
