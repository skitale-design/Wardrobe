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

loop do # Цикл для удобства тестирования - для выхода набрать "q"
  puts "Для выхода из цикла набрать \"q\""

  print "Сейчас градусов на улице: "
  user_input = STDIN.gets.chomp
  break if user_input == "q"
  temperature = user_input.to_i

  clothes = Clothes.new(path_to_data)

  puts "\n\nГрадусов за окном: #{user_input} Предлагаю надеть:\n\n"

  clothes.select_for_temperature(temperature).each do |item|
      puts "#{item}: #{clothes.random_cloth(item).name}"\
      "  (#{clothes.random_cloth(item).temperature_range})"
  end
  puts "\n---------------------"
end
