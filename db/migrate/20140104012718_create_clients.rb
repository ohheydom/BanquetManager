class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :guests_of_honor
      t.date :date_of_event
      t.date :date_booked
      t.string :type_of_event
      t.integer :minimum_guarantee
      t.integer :amount_of_guests
      t.decimal :base_price
      t.decimal :additional_charges
      t.decimal :deposit
      t.date :payment_1_date
      t.date :payment_2_date
      t.date :final_payment_date
      t.decimal :payment_1
      t.decimal :payment_2
      t.date :menu

      t.timestamps
    end
  end
end
