require_relative 'cloth'

class Clothes

  def initialize(temperature, path)
    @temperature = temperature
    read_from_files(path)
  end
  # Выбираем
  def set_for_temperature

  end

  def read_from_files(path)
    clothes_array = []
    Dir.glob("#{path}/*.txt") do |file|
      puts "file = #{file}" # ---------- test
      # для каждого файла создаем отдельный экземпляр класса Cloth
      if !File.zero?(file) # проверка, что в файле есть текст
        cloth = Cloth.new(@temperature, file)
      end
      # Набираем в массив все шмотки
      # puts "cloth.name = #{cloth.name}" # ---------- test
      clothes_array << cloth
    end
  end

end
