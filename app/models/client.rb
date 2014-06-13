class Client < ActiveRecord::Base
  include ClientValidations
  include TodolistDates

  belongs_to :user
  scope :future, -> { where('date_of_event > ?', Date.today) }
  scope :past, -> { where('date_of_event < ?', Date.today) }

  def self.search(search)
    if search
      where('name ilike ? OR guests_of_honor ilike ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
