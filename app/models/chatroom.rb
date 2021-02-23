class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  # has_many :users
  belongs_to :customer, class_name: "User"
  belongs_to :contractor, class_name: "User"
end
