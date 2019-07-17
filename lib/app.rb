require_relative 'log_parser'
require_relative 'printer'

class App

  def initialize(log_parser_class: LogParser, printer_class: Printer)
  end

  def parse(file)
    printer = Printer.new
    log_parser = LogParser.new(file)

    log_parser.parse
    log_parser.count_visits
    log_parser.find_unique
    log_parser.sort

    puts "List of webpages with most page views"
    printer.print(log_parser.visits_per_page[0])

    puts "List of webpages with most unique page views"
    printer.print(log_parser.visits_per_page[1])
  end

end
