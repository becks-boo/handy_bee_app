class BusinessLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :business

  BUSINESS_LANGUAGES = %w(English German French)
end
