class Booking < ApplicationRecord
  belongs_to :business
  belongs_to :user

  has_one :review, dependent: :destroy
  
  validates :start_date, :end_date, :price, presence: true
end
