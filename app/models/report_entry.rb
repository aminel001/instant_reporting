class ReportEntry < ApplicationRecord
  belongs_to :report
  has_one_attached :photo

  after_save :sync_title_to_report, if: :title_entry?


  private

  def title_entry?
    label == "Titre"
  end

  def sync_title_to_report
    report.update_columns(title: value_text)
  end
end
