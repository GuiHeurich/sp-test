class LogParser

  def parse(file)
    parsed_file = File.readlines file
    parsed_file.map do |line|
      line.split(" ")[0]
    end
  end

end
