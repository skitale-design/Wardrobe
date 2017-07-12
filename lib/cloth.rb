class Cloth
  attr_reader :name, :type, :temperature_string, :temperature_array

  def initialize(path)
    read_from_files(path)
  end
# Читаем из файл данные шмотки
  def read_from_files(path)
    cloth = []
    file = File.new(path, "r:UTF-8")
    cloth = file.readlines
    file.close
    @name = cloth[0].chomp
    # puts "-------- @name = #{@name}"
    @type = cloth[1].chomp
    # puts "-------- @type = #{@type}"
    @temperature_range = convert_to_range(cloth[2].chomp)
    # puts "-------- @temperature_range = #{@temperature_range}"
  end
  # Превращаем прочтенную из файла строку в диапазон
  def convert_to_range(temperature_string)
    temperature_array = temperature_string.gsub(/[( )]/,'').split(',')
    range = temperature_array[0].to_i..temperature_array[1].to_i
  end
  # Проверка подходит ли данная одежда для введенной погоды
  def fits?(temperature)
    @temperature_range.include?(temperature.to_i)
  end

end

