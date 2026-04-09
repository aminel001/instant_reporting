class RemoveTemplateSectionIdFromReportEntries < ActiveRecord::Migration[7.1]
  def change
    remove_column :report_entries, :template_section_id, :integer
  end
end
