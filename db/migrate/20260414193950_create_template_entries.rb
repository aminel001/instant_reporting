class CreateTemplateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :template_entries do |t|
      t.string :label
      t.string :field_type
      t.references :report_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
