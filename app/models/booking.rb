class Booking < ApplicationRecord
  belongs_to :business
  # belongs_to :user
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
  belongs_to :contractor, class_name: 'User', foreign_key: 'contractor_id'

  has_many :reviews, dependent: :destroy

  validates :start_date, :end_date, :price, presence: true
end
