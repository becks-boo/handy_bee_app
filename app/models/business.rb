class Business < ApplicationRecord
  CATEGORY = %w(Painting Carpentry Plumbing Electrical Landscaper Engineer Estimator Cabinet-Maker Heating-Technician Laborer Drywall Mechanic Welder Mason Roofer Floorer)
  belongs_to :contractor, class_name: 'User', foreign_key: 'user_id'

  has_many :bookings, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :business_languages, dependent: :destroy
  has_many :languages, through: :business_languages
  has_many_attached :pictures

  validates :name, :description, :category, :location, presence: true

  # Method to count the average of the rating will be called in show page
  def average_rating
    if self.reviews.count >= 1
      ratings = []
      self.reviews.each do |r|
        ratings << r.rating
      end
      average = ratings.sum.to_f / ratings.length.to_f
    end
  end
end
