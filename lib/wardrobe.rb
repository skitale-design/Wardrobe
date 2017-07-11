class Wardrobe

  def initialize(path)
    read_from_files(path)
  end

  def read_from_files(path)
    each_cloth = []
    Dir.glob("#{path}/*.txt") do |filename|
      puts "filename = #{filename}" # ------------ test
      one_cloth = []
      file = File.new(filename)
      one_cloth = file.readlines
      file.close
      puts "one_cloth = #{one_cloth}" # ------------ test
      each_cloth << one_cloth
    end
    return each_cloth
  end


end
