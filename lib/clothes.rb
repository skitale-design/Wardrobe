class Clothes
# Автоматом создаем геттеры для переменных
  attr_reader :type_list

  # def initialize(temperature, path)
  def initialize(path)
    @wardrobe = []
    @fits_the_weather = []
    read_from_file(path)
  end

  # Выбираем подходящую под температуру одежду
  def select_for_temperature(temperature)
    appropriate_types = []
    @wardrobe.each do |item|
      if item.fits?(temperature)
        @fits_the_weather << item
        # Соберем массив из типов подходящих вещей
        appropriate_types << item.type
      end
    end
    @type_list = appropriate_types.uniq
  end

  # Получить случайный элемент одежды указанного типа
  def random_cloth(type)
    # "Выбери из @fits_the_weather только элементы указанного типа, а потом возьми случайный
    @fits_the_weather.select { |item| item.type == type }.sample
  end

  def read_from_file(path)
    # Перебираем каждый txt-файл в папке с путем "path"
    Dir.glob("#{path}/*.txt") do |file|
      # Проверка, что в файле есть текст
      unless File.zero?(file)
        # для каждого файла создаем отдельный экземпляр класса Cloth
        cloth = Cloth.read_from_file(file)
        # Добавляем в массив одежды новую шмотку:
        @wardrobe << cloth
      end
    end
  end
end
