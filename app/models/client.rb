class Client < ActiveRecord::Base
  belongs_to :user
  
  scope :future, -> { where('date_of_event >= ?', Date.today) }
  scope :past, -> { where('date_of_event <= ?', Date.today) }

  #Validations
  validates :name, :guests_of_honor, :type_of_event, :minimum_guarantee, :amount_of_guests, :base_price, :deposit, presence: true
  validates :minimum_guarantee, :amount_of_guests, :phone_number, :base_price, :additional_charges, :deposit, 
            numericality: true

  class << self
    def search(search)
      if search
        where('name ilike ? OR guests_of_honor ilike ?', "%#{search}%", "%#{search}%")
      else
        all 
      end
    end
  end
end
