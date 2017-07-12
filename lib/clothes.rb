# Мы будем создавать экземпляры класса Cloth, для этого подключаем его
require_relative 'cloth'

class Clothes

# Автоматом создаем геттеры для переменных
attr_reader :hats, :jackets, :shooses

  def initialize(temperature, path)
    @clothes = []
    @hats = []
    @jackets = []
    @shooses = []
    read_from_files(temperature, path)
    set_for_temperature(temperature)
  end
  # Выбираем подходящую под температуру одежду
  def set_for_temperature(temperature)
      @clothes.each do |item|
        if item.temperature_fits?(temperature)
          case item.type
          when "Головной убор" then @hats << item.name
          when "Одежда"  then @jackets << item.name
          when "Обувь" then @shooses << item.name
          end
        end
      end
  end

  def read_from_files(temperature, path)
      # Перебираем каждый файл в папке с путем path
    Dir.glob("#{path}/*.txt") do |file|
      # Проверка, что в файле есть текст
      if !File.zero?(file)
        # для каждого файла создаем отдельный экземпляр класса Cloth
        cloth = Cloth.new(temperature, file)
        # Добавляем в массив одежды новую шмотку:
        @clothes << cloth
      end
    end
  end

end
      # puts "file = #{file}" # ---------- test
        # Набираем в массив все шмотки
        # puts "Cloth:: cloth.name = #{cloth.name}" # ---------- test
        # puts "Cloth:: cloth = #{cloth}" # ---------- test
        # puts "------------- TEST ------------------"
        # puts "Cloth:: item.type = #{item.type}" # ---------- test
        # puts "Cloth:: item.temperature_fits?(temperature) = #{item.temperature_fits?(temperature)}" # ---------- test
        # puts "Cloth:: @hats = #{@hats}" # ---------- test
        # puts "Cloth:: @jackets = #{@jackets}" # ---------- test
        # puts "Cloth:: @shooses = #{@shooses}" # ---------- test
        # puts
        # @hats << item.name
