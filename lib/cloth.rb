class Cloth

  attr_reader :name, :type, :temperature_string, :temperature_array

  def initialize(temperature, path)
    read_from_files(path)
    # temperature_fits?(temperature)
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

        # puts "file.readlines = #{file.readlines}" # ------------ test
        # puts "cloth = #{cloth}" # ------------ test
        # puts "@name = #{@name}" # ------------ test
        # puts "@type = #{@type}" # ------------ test
        # puts "@temperature_string = #{@temperature_string}" # ------------ test
  end

  def convert_to_range(temperature_string)
    temperature_array = @temperature_string.gsub(/[( )]/,'').split(',')
    range = temperature_array[0].to_i..temperature_array[1].to_i
    return range
  end

  def temperature_fits?(temperature)
    if convert_to_range(@temperature_string).include?(temperature.to_i)
      # puts "temperature_range.include?(temperature.to_i) = OK" #----------- test
      return true
    end
  end
    # puts "temperature_array = #{temperature_array}"
    # puts "temperature_range = #{temperature_range}"
    # puts "temperature = #{temperature}"
    # puts "(temperature_array[0].to_i..temperature_array[1].to_i).include?(temperature.to_i) = #{(temperature_array[0].to_i..temperature_array[1].to_i).include?(temperature.to_i)}"
    # puts "(10..25).include?(temperature) = #{(10..25).include?(temperature)}"

end
