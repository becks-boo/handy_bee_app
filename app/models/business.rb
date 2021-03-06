class Business < ApplicationRecord
  CATEGORY = %w(Painting Carpentry Plumbing Electrical Landscaper Engineer Estimator Cabinet-Maker Heating-Technician Laborer Drywall Mechanic Welder Mason Roofer Floorer)
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :business_languages
  has_many :languages, through: :business_languages
  has_many_attached :pictures

  validates :name, :description, :category, :location, presence: true
end
