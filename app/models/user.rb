class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :businesses, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chatrooms_as_customer, foreign_key: :customer_id, class_name: :Chatroom, dependent: :destroy
  has_many :chatrooms_as_contractor, foreign_key: :contractor_id, class_name: :Chatroom, dependent: :destroy

  has_one_attached :picture, dependent: :destroy

  validates :user_name, :role, presence: true
end
