class Business < ApplicationRecord
  LANGUAGES = %w(English French German Arabic Turkish Farsi Portuguese Spanish Russian Manding)
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many_attached :pictures

  validates :name, :description, :category, :location, :language, presence: true
end
