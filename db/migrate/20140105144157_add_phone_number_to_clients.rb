class AddPhoneNumberToClients < ActiveRecord::Migration
  def change
    add_column :clients, :phone_number, :integer
  end
end
