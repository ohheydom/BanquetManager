class User < ActiveRecord::Base
  include Commissions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :clients
end
