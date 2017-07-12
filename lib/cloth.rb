class Cloth

  attr_reader :name, :type, :temperature_string, :temperature_array

  def initialize(temperature, path)
    read_from_files(path)
  end
# Читаем из файл данные шмотки
  def read_from_files(path)
        cloth = []
        file = File.new(path, "r:UTF-8")
        cloth = file.readlines
        file.close
        @name = cloth[0].chomp
        @type = cloth[1].chomp
        @temperature_string = cloth[2].chomp
  end

  # Превращаем прочтенную из файла строку в диапазон
  def convert_to_range(temperature_string)
    temperature_array = @temperature_string.gsub(/[( )]/,'').split(',')
    range = temperature_array[0].to_i..temperature_array[1].to_i
    return range
  end

  # Проверка подходит ли данная одежда для введенной погоды
  def temperature_fits?(temperature)
    convert_to_range(@temperature_string).include?(temperature.to_i)
      # puts "temperature_range.include?(temperature.to_i) = OK" #----------- test
      # return true
    # end
  end

end

        # puts "file.readlines = #{file.readlines}" # ------------ test
        # puts "cloth = #{cloth}" # ------------ test
        # puts "@name = #{@name}" # ------------ test
        # puts "@type = #{@type}" # ------------ test
        # puts "@temperatu

        # puts "temperature_array = #{temperature_array}"
    # puts "temperature_range = #{temperature_range}"
    # puts "temperature = #{temperature}"
    # puts "(temperature_array[0].to_i..temperature_array[1].to_i).include?(temperature.to_i) = #{(temperature_array[0].to_i..temperature_array[1].to_i).include?(temperature.to_i)}"
    # puts "(10..25).include?(temperature) = #{(10..25).include?(temperature)}"
