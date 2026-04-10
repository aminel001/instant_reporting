class Company < ApplicationRecord
  has_many :users
  has_many :report_templates
  has_one_attached :logo
end
