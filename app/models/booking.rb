class Booking < ApplicationRecord
  belongs_to :business
  # belongs_to :user
  belongs_to :customer, class_name: "User"
  belongs_to :contractor, class_name: "User"

  has_many :reviews, dependent: :destroy

  validates :start_date, :end_date, :price, presence: true
end
