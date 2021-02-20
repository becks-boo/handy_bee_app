class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business
  belongs_to :booking
end
