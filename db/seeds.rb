# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "User destroyed"
Team.destroy_all
puts "Teams destroyed"
Project.destroy_all
puts "Projects destroyed"



alex = User.create!(
  name: "alex",
  email: "alex@alex.com",
  password: "azerty"
  )


 team = Team.create!(
  name: "Team",
  user_id: alex,
  )


  projet = Project.create!(
  user: alex,
  team: team,
  name: "Ouesh",
  description: "Yo"
)
