FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'tester12'
    password_confirmation 'tester12'
  end

  factory :client do
    name 'Jim Johnson'
    guests_of_honor 'Jerry Johnson'
    phone_number '2222222222'
    date_of_event Date.today + 55
    date_booked Date.today - 55
    type_of_event 'WE'
    minimum_guarantee 150
    amount_of_guests 150
    base_price 100
    additional_charges 500
    deposit 500
    payment_1_date Date.today - 44
    payment_2_date Date.today - 33
    final_payment_date Date.today + 44
    payment_1 499
    payment_2 499
    menu Date.today - 44
    user
  end
end
