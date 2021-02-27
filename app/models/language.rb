class Language < ApplicationRecord
  has_many :business_languages
  has_many :businesses, through: :business_languages
end
