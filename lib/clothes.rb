# Мы будем создавать экземпляры класса Cloth, для этого подключаем его
require_relative 'cloth'

class Clothes
# Автоматом создаем геттеры для переменных
attr_reader :hats, :overclothes, :shoes

  def initialize(temperature, path)
    @clothes = []
    @hats = []
    @overclothes = []
    @shoes = []
    read_from_files(temperature, path)
    select_for_temperature(temperature)
  end
  # Выбираем подходящую под температуру одежду
  def select_for_temperature(temperature)
      @clothes.each do |item|
        if item.fits?(temperature)
          case item.type
          when "Головной убор" then @hats << item.name
          when "Одежда"  then @overclothes << item.name
          when "Обувь" then @shoes << item.name
          end
        end
      end
  end

  def read_from_files(temperature, path)
      # Перебираем каждый txt-файл в папке с путем "path"
    Dir.glob("#{path}/*.txt") do |file|
      # Проверка, что в файле есть текст
      if !File.zero?(file)
        # для каждого файла создаем отдельный экземпляр класса Cloth
        cloth = Cloth.new(file)
        # Добавляем в массив одежды новую шмотку:
        @clothes << cloth
      end
    end
  end
end
