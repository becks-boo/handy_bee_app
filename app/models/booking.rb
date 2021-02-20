class Booking < ApplicationRecord
  belongs_to :business
  belongs_to :user

  has_one :review, dependent: :destroy
end
