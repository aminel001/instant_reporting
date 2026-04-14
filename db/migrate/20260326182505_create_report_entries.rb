class CreateReportEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :report_entries do |t|
      t.string :value_text
      t.string :value_json
      t.string :label
      t.references :template_section, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
