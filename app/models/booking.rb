class Booking < ApplicationRecord
  has_one :review

  belongs_to :business
  belongs_to :user
end
