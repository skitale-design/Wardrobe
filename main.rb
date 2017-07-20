# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX ------------------------------
require_relative 'lib/clothes'
require_relative 'lib/cloth'

path_to_data = "./data"

loop do # Цикл для удобства тестирования - для выхода набрать "111"
  puts "Для выхода из цикла набрать \"q\""

  print "Сейчас градусов на улице: "
  user_input = STDIN.gets.chomp
  break if user_input == "q"
<<<<<<< HEAD
  temperature = user_input.to_i

  clothes = Clothes.new(path_to_data)
=======
  
  # Для наглядности тут конвертим ввод пользователя в число:
  temperature = user_input.to_i
  
  # Создаем экземпляр класса "Clothes" и передаем ему температуру и путь к файлам
  clothes = Clothes.new(temperature, path_to_data)
>>>>>>> 16fd00111d278ccb2c51f311a560169969539278

  puts "\n\nГрадусов за окном: #{user_input} Предлагаю надеть:\n\n"

  clothes.select_for_temperature(temperature).each do |item|
      puts "#{item}: #{clothes.random_cloth(item).name}  (#{clothes.random_cloth(item).temperature_range})"
  end
  puts "\n---------------------"
end
