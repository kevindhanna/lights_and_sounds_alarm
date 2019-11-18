# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Setting up Hue'
begin
  LightGroup.update_groups
rescue StandardError => e
  if e.message.include?('button')
    puts 'Push button now!'
    sleep 10
    LightGroup.update_groups
    puts 'Done!'
  else
    puts 'Something went wrong:'
    puts e.message
  end
end
