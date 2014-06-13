module TodolistDates
  extend ActiveSupport::Concern

  module ClassMethods
    def payments(date)
      where("(payment_1_date >= ? AND payment_1_date <= ?) OR (payment_2_date >= ? AND payment_2_date <= ?) OR (final_payment_date >= ? AND final_payment_date <= ?)", date, date+6, date, date+6, date, date+6)
    end

    def finals(date)
      where(menu: date..(date+6))
    end

    def counts(date)
      where(final_payment_date: (date+6)..(date+13))
    end
  end
end
