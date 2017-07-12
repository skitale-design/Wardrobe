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
loop do
print "Сейчас градусов на улице: "
user_input = STDIN.gets.to_i
  # Создаем экземпляр класса "Clothes"
  cloth = Clothes.new(user_input, path_to_data)
  puts "Сегодня #{user_input} Предлагаю надеть сегодня:"
  puts "Головной убор: #{cloth.hat_array.sample}"
  puts "Одежда: #{cloth.jacket_array.sample}"
  puts "Обувь: #{cloth.shoose_array.sample}"
  puts
  break if user_input == 111
end
