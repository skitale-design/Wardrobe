# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

require_relative 'lib/clothes'

path_to_data = "./data"

puts "Сколько градусов сейчас?"
user_input = STDIN.gets.to_s
# Создаем экземпляр класса "Clothes"
puts "Предлагаю надеть сегодня:"
Clothes.new(user_input, path_to_data)
