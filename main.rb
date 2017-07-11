require_relative 'lib/clothes'

path_to_data = "./data"

puts "Сколько градусов сейчас?"
user_input = STDIN.gets.to_s
# Создаем экземпляр класса "Clothes"
puts "Предлагаю надеть сегодня:"
Clothes.new(user_input, path_to_data)
