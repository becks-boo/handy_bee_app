class Booking < ApplicationRecord
  belongs_to :business
  # belongs_to :user
  belongs_to :contractor, class_name: "User"
  # and :customer??? (optional: true)?

  has_one :review, dependent: :destroy

  validates :start_date, :end_date, :price, presence: true
end
