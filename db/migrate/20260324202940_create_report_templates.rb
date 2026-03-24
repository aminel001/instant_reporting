class CreateReportTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :report_templates do |t|
      t.string :name
      t.string :description
      t.string :status
      t.string :template_version
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
