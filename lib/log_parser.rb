class LogParser

  def parse(file)
    parsed_file = File.readlines file
    parsed_lines = []
    parsed_file.map do |line|
      parsed_lines.push(line.split(" ")[0])
    end
    parsed_lines
  end
  
end
