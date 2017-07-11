class Cloth

  attr_reader :name, :type, :temperature_range

  def initialize(temperature, path)
    read_from_files(path)
    temperature_fits?(temperature)
  end


# Читаем из файл данные шмотки
  def read_from_files(path)
        cloth = []
        file = File.new(path, "r:UTF-8")
        # puts "file.readlines = #{file.readlines}" # ------------ test
        cloth = file.readlines
        puts "cloth = #{cloth}" # ------------ test
        file.close
        @name = cloth[0].chomp
        puts "@name = #{@name}" # ------------ test
        @type = cloth[1].chomp
        puts "@type = #{@type}" # ------------ test
        @temperature_range = cloth[2].chomp
        puts "@temperature_range = #{@temperature_range}" # ------------ test
  end

  def temperature_fits?(temperature)
    temp = @temperature_range.gsub(/[( )]/,'').split(',')
    puts "temp = #{temp}"
    puts "temperature = #{temperature}"
    puts "(temp[0].to_i..temp[1].to_i).include?(temperature) = #{(temp[0].to_i..temp[1].to_i).include?(temperature)}"
    # if temperature
  end

end


