class Business < ApplicationRecord
   belongs_to :user

   has_many :bookings, dependent: :destroy
   has_many :reviews, dependent: :destroy

   validates :name, :description, :category, :picture, presence: true
end
