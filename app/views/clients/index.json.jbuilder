json.array!(@clients) do |client|
  json.extract! client, :id, :name, :guests_of_honor, :date_of_event, :date_booked, :type_of_event, :minimum_guarantee, :amount_of_guests, :base_price, :additional_charges, :deposit, :payment_1_date, :payment_2_date, :final_payment_date, :payment_1, :payment_2, :menu
  json.url client_url(client, format: :json)
end
