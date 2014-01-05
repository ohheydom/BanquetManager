class Client < ActiveRecord::Base
  scope :future, -> { where('date_of_event > ?', Date.today) }
  scope :past, -> { where('date_of_event < ?', Date.today) }
  
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
