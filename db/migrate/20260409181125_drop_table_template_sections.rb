class DropTableTemplateSections < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :report_entries, :template_sections

    drop_table :template_sections
  end
end
