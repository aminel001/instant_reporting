# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Report.destroy_all
ReportTemplate.destroy_all
User.destroy_all
Company.destroy_all

chrix = Company.create!(name: "Chrix")
nokia = Company.create!(name: "nokia")
amine = User.create!(email: "amine.e@chrix.ma", password: "123456", first_name: "Amine", last_name: "EL", company_id: Company.first.id)
haytham = User.create!(email: "hitoburn@hotmail.fr", password: "123456", first_name: "Haytham", last_name: "LAN", company_id: Company.second.id)

template_A = ReportTemplate.create!(name: "Template A", description: "template A", company: chrix, user: amine)
template_B = ReportTemplate.create!(name: "Template B", description: "template B", company: chrix, user: amine)
template_C = ReportTemplate.create!(name: "Template C", description: "template C", company: chrix, user: amine)

TemplateEntry.create!(label: "Titre", field_type: "string", report_template: template_A)
TemplateEntry.create!(label: "Analyse", field_type: "string", report_template: template_A)
TemplateEntry.create!(label: "Conclusion", field_type: "string", report_template: template_A)
TemplateEntry.create!(label: "Titre", field_type: "string", report_template: template_B)
TemplateEntry.create!(label: "Analyse", field_type: "string", report_template: template_B)
TemplateEntry.create!(label: "photo", field_type: "photo", report_template: template_B)
TemplateEntry.create!(label: "Conclusion", field_type: "string", report_template: template_B)
TemplateEntry.create!(label: "Titre", field_type: "string", report_template: template_C)
TemplateEntry.create!(label: "Date", field_type: "date", report_template: template_C)
TemplateEntry.create!(label: "Analyse", field_type: "string", report_template: template_C)
TemplateEntry.create!(label: "photo", field_type: "photo", report_template: template_C)
TemplateEntry.create!(label: "Conclusion", field_type: "string", report_template: template_C)
