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
Company.destroy_all
User.destroy_all


amine = User.create!(email: "amine.e@chrix.ma", password: "123456", first_name: "Amine")

chrix = Company.create!(name: "Chrix")

ReportTemplate.create!(name: "Template A", description: "template A", company: chrix, user: amine)
ReportTemplate.create!(name: "Template B", description: "template B", company: chrix, user: amine)
ReportTemplate.create!(name: "Template C", description: "template C", company: chrix, user: amine)
