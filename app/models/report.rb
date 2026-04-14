class Report < ApplicationRecord
  belongs_to :report_template
  belongs_to :user
  has_many :report_entries
end
