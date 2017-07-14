class Cloth
  attr_reader :name, :type, :temperature_range

  def initialize(name, type, temperature_range)
    @name = name
    @type = type
    @temperature_range = convert_to_range(temperature_range)
  end

  # МЕТОД КЛАССА Cloth (ключевое слово "self.")  - может быть вызван так же как Cloth.new()
  def self.read_from_file(path)
    cloth = []
    # Читаем из файл данные шмотки
    file = File.new(path, "r:UTF-8")
    cloth = file.readlines
    file.close
    # "Вызови метод initialize с параметрами cloth[0].chomp, cloth[1].chomp, cloth[2].chomp"
    new(cloth[0].chomp, cloth[1].chomp, cloth[2].chomp)
  end

  # Превращаем прочтенную из файла строку в диапазон чисел
  def convert_to_range(temperature_string)
    temperature_array = temperature_string.gsub(/[( )]/,'').split(',')
    temperature_array[0].to_i..temperature_array[1].to_i
  end

  # Проверка подходит ли данная одежда для введенной погоды
  def fits?(temperature)
    @temperature_range.include?(temperature)
  end
end

