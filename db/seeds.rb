# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "****************************************"
puts " Create data initial for Categories on app"
puts "****************************************"

categories = ["Animais e Acessórios",
              "Esportes",
              "Para a sua casa",
              "Eletrônicos e Celulares",
              "Música e Hobbies",
              "Bebês e Crianças",
              "Moda e Beleza",
              "Veículos e Barcos",
              "Imóveis",
              "Empregos e Negócios"]
categories.each do |category|
Category.find_or_create_by!(description: category)
puts "Category: #{category} created was success!"
end
puts "\n"
puts "Categories generated with success!"
puts "****************************************"
puts "Create admin default for app"
puts "****************************************"

admin = Admin.new
admin.email = "admin@admin.com"
admin.name = "Antonio Ricardo"
admin.password = "123456"
admin.password_confirmation = "123456"
admin.role = 0

if admin.save
  puts "Admin created was success!"
else
  puts "Error Admin Create"
end
