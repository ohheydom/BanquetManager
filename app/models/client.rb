class Client < ActiveRecord::Base
  scope :active, -> { where('date_of_event > ?', Date.today) }
  scope :inactive, -> { where('date_of_event < ?', Date.today) }
  
  class << self
    def search(search)
      if search
        where('name ilike ?', "%#{search}%")
      else
        all 
      end
    end
  end
end
