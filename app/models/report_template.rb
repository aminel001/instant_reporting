class ReportTemplate < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :reports
  has_many :template_entries
end
