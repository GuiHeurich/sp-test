class LogParser

  attr_reader :visits_per_page

  def initialize(log_file_path)
    @log_file_path = log_file_path
    @visits_per_page = {}
  end

  def parse
    raise "File empty. Upload valid file" if File.empty?(@log_file_path)
    
    parsed_file = File.readlines @log_file_path
    @visited_pages = parsed_file.map do |line|
      line.split(" ")[0]
    end
  end

  def count_visits
    @visited_pages.map do |page|
      @visits_per_page.include?(page) ? @visits_per_page[page] += 1 : @visits_per_page[page] = 1
    end
    @visits_per_page
  end

  def find_unique
    @normal_views = @visits_per_page.select { |key| key.count("0-9").zero? }
    @unique_views = @visits_per_page.select { |key| key.count("0-9").positive? }
  end

  def sort
    @normal_views = @normal_views.sort_by { |_pages, visits| visits }.reverse
    @unique_views = @unique_views.sort_by { |_pages, visits| visits }.reverse
    merge
  end

private
  def merge
    @visits_per_page = [@normal_views] | [@unique_views]
  end

end
