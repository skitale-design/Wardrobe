require_relative 'cloth'

class Clothes

attr_reader :temperature, :hat_array, :jacket_array, :shoose_array

  def initialize(temperature, path)
    # @temperature = temperature
    read_from_files(temperature, path)
    @hat_array = []
    @jacket_array = []
    @shoose_array = []
    set_for_temperature(temperature)
  end
  # Выбираем
  def set_for_temperature(temperature)
      @clothes_array.each do |item|
        # @hat_array << item.name
        if item.temperature_fits?(temperature)
          case item.type
          when "Головной убор" then @hat_array << item.name
          when "Одежда"  then @jacket_array << item.name
          when "Обувь" then @shoose_array << item.name
          end
        end
        # puts "------------- TEST ------------------"
        # puts "Cloth:: item.type = #{item.type}" # ---------- test
        # puts "Cloth:: item.temperature_fits?(temperature) = #{item.temperature_fits?(temperature)}" # ---------- test
        # puts "Cloth:: @hat_array = #{@hat_array}" # ---------- test
        # puts "Cloth:: @jacket_array = #{@jacket_array}" # ---------- test
        # puts "Cloth:: @shoose_array = #{@shoose_array}" # ---------- test
        # puts
      end
  end

  def read_from_files(temperature, path)
    @clothes_array = []
    Dir.glob("#{path}/*.txt") do |file|
      # puts "file = #{file}" # ---------- test
      # для каждого файла создаем отдельный экземпляр класса Cloth
      if !File.zero?(file) # проверка, что в файле есть текст
        cloth = Cloth.new(temperature, file)
        # Набираем в массив все шмотки
        # puts "Cloth:: cloth.name = #{cloth.name}" # ---------- test
        # puts "Cloth:: cloth = #{cloth}" # ---------- test
        @clothes_array << cloth
      end
    end
  end

end
