class Booking < ApplicationRecord
  belongs_to :business
  belongs_to :user

  has_many :reviews, dependent: :destroy
end
