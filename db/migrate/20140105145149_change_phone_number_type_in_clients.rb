class ChangePhoneNumberTypeInClients < ActiveRecord::Migration
  def self.up
    change_column :clients, :phone_number, :string, :limit => 12
  end

  def self.down
    change_column :clients, :phone_number, :integer
  end
end
