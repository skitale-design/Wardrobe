# Мы будем создавать экземпляры класса Cloth, для этого подключаем его
require_relative 'cloth'

class Clothes
# Автоматом создаем геттеры для переменных
attr_reader :type_list

  def initialize(temperature, path)
    @wardrobe = []
    @fits_the_weather = []
    @appropriate_types = []
    read_from_file(path)
    select_for_temperature(temperature)
    # Пересечение множества всех типов оджеды с множеством подходящих типов оджеды
    @type_list = list_of_types & @appropriate_types
  end

  # Выбираем подходящую под температуру одежду
  def select_for_temperature(temperature)
      @wardrobe.each do |item|
        if item.fits?(temperature)
          # Если вещь подходит к погоде, то положим ее в массив подходящих вещей
          @fits_the_weather << item
          # Соберем массив из типов подходящих вещей
          @appropriate_types << item.type
        end
      end
  end

  # Список всех типов, которые вообще встречаются (строка 2 в txt-файле)
  def list_of_types
    # "У каждого элемента массива @wardrobe возьми тип
    # и выбери из них только уникальные элементы"
    @wardrobe.map { |item| item.type }.uniq
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
