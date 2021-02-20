class Business < ApplicationRecord
   belongs_to :user

  # UNCOMMENT when creating these tables

   has_many :bookings, dependent: :destroy
   has_many :reviews, through: :bookings, dependent: :destroy
   has_many_attached :pictures

   validates :name, :description, :category, :location, :language, presence: true
end
