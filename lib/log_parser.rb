class LogParser

  def initialize
    @pages = []
    @visits_per_page = {}
  end

  def parse(file)
    parsed_file = File.readlines file
    @pages = parsed_file.map do |line|
      line.split(" ")[0]
    end
  end

  def count_visits
    @pages.map do |page|
      if @visits_per_page.include?(page)
        @visits_per_page[page] += 1
      else
        @visits_per_page[page] = 1
      end
    end
    @visits_per_page
  end

end
