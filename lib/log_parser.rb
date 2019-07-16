class LogParser

  def initialize
    @visits_per_page = {}
    @unique_views = []
    @normal_views = []
  end

  def parse(file)
    parsed_file = File.readlines file
    @pages = parsed_file.map do |line|
      line.split(" ")[0]
    end
  end

  def count_visits
    @pages.map do |page|
      @visits_per_page.include?(page) ? @visits_per_page[page] += 1 : @visits_per_page[page] = 1
    end
    @visits_per_page
  end

  def find_unique
    @normal_views = @visits_per_page.select { |key| key.count("0-9").zero? }
    @unique_views = @visits_per_page.select { |key| key.count("0-9").positive? }
  end

  def sort(list)
    list.sort_by { |_pages, visits| visits }.reverse
  end

end
