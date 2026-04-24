class ChangeReportVersionNumberToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :reports, :report_version_number, :integer, using: 'report_version_number::integer'
  end
end
