class ReportEntry < ApplicationRecord
  belongs_to :template_section
  belongs_to :report
end
