require 'log_parser'

describe LogParser do

  subject(:log_parser) { described_class.new }
  let(:file) { "./data/webserver.log" }

  describe '#parse' do
    context 'when given a .log file' do
      it 'returns an array with individual lines' do
        expect(log_parser.parse(file)).to be_an_instance_of(Array)
      end

      it 'shows only the page name in each line' do
        expect(log_parser.parse(file)[0]).to eq("/help_page/1")
      end
    end
  end

  describe '#count_visits' do
    context 'when given an array of visited pages' do
      it 'returns an array with the page and its number of visits' do
        pages = log_parser.parse(file)
        expect(log_parser.count_visits(pages)).to include("/help_page/1" => 80)
      end
    end
  end

  describe '#find_unique' do
    context 'when given a hash of visits per page' do
      it 'selects keys that are strings with integers' do
        visits_per_page = {
          "/help_page/1"=>80,
          "/contact"=>89,
          "/home"=>78,
          "/about/2"=>90,
          "/index"=>82,
          "/about"=>81
        }
        expect(log_parser.find_unique(visits_per_page)).to include("/about/2" => 90)
        expect(log_parser.find_unique(visits_per_page)).not_to include("/home" => 78)
      end
    end
  end

  describe '#sort' do
    context 'when given an array of pages and number of visits' do
      it 'sorts the array by visits in a descending order' do
        visits_per_page = {
          "/help_page/1"=>80,
          "/contact"=>89,
          "/home"=>78,
          "/about/2"=>90,
          "/index"=>82,
          "/about"=>81
        }
        log_parser.find_unique(visits_per_page)
        expect(log_parser.sort.min).to eq(["/about/2", 90])
      end
    end
  end

  describe '#print' do
    context 'when given an array' do
      it 'prints out the elements' do
        list = [["/about/2", 90], ["/help_page/1", 80]]
        expect(log_parser.print(list)).to eq("/about/2 90 /help_page/1 80 ")
      end
    end
  end
end
