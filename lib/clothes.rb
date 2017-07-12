# Мы будем создавать экземпляры класса Cloth, для этого подключаем его
require_relative 'cloth'

class Clothes
# Автоматом создаем геттеры для переменных
attr_reader :type_list

  def initialize(temperature, path)
    @wardrobe = []
    @fits_the_weather = []
    @appropriate_types = []
    read_from_files(path)
    select_for_temperature(temperature)
    # Пересечение множества всех типов оджеды с множеством подходящих типов оджеды
    @type_list = type_list_method & @appropriate_types
  end

  # Выбираем подходящую под температуру одежду
  def select_for_temperature(temperature)
      @wardrobe.each do |item|
        if item.fits?(temperature)
          # Если вещь подходит к погоде, то положим ее в массив подходящих вещей
          @fits_the_weather << item
          @appropriate_types << item.type
        end
      end
  end

  # Список всех типов, которые вообще встречаются (строка 2 в txt-файле)
  def type_list_method
    type_array = []
    # Перебираем весь шкаф
    @wardrobe.each do |item|
      # складываем типы вещей в массив
      type_array << item.type
    end
    # Оставляем в списке вещей только уникальные названия
    return type_array.uniq
  end

  # Получить случайный элемент одежды указанного типа
  def random_cloth(type)
    cloth_array = []
    @fits_the_weather.each do |item|
      cloth_array << item if item.type == type
    end
    return cloth_array.sample
  end

  def read_from_files(path)
      # Перебираем каждый txt-файл в папке с путем "path"
    Dir.glob("#{path}/*.txt") do |file|
      # Проверка, что в файле есть текст
      if !File.zero?(file)
        # для каждого файла создаем отдельный экземпляр класса Cloth
        cloth = Cloth.new(file)
        # Добавляем в массив одежды новую шмотку:
        @wardrobe << cloth
      end
    end
  end
end
