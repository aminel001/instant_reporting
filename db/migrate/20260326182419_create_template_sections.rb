class CreateTemplateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :template_sections do |t|
      t.string :key
      t.string :label
      t.string :field_type
      t.string :position
      t.string :required
      t.string :setting
      t.references :report_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
