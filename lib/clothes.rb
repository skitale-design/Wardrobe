require_relative 'wardrobe'

class Clothes

  def initialize(temperature, path)
    @temperature = temperature
    clothes_array = Wardrobe.new(path)
  end

  def set_for_temperature

  end

end
