require 'log_parser'

describe LogParser do

  let(:file) { "./data/webserver.log" }
  let(:empty_file) { "./data/empty.log" }
  subject(:log_parser) { described_class.new(file) }

  describe '#parse' do
    context 'when given a .log file' do
      it 'returns an array with individual lines' do
        expect(log_parser.parse).to be_an_instance_of(Array)
      end

      it 'shows only the page name in each line' do
        expect(log_parser.parse[0]).to eq("/help_page/1")
      end
    end

    # Edge case:
    # An empty file should throw an Error;
    context 'when given an empty file' do
      it 'throws an error asking for a valid file' do
        log_parser_two = LogParser.new(empty_file)
        expect { log_parser_two.parse }.to raise_error("File empty. Upload valid file")
      end
    end
  end

  describe '#count_visits' do
    context 'when given an array of visited pages' do
      it 'returns an array with the page and its number of visits' do
        log_parser.parse
        expect(log_parser.count_visits).to include("/help_page/1" => 80)
      end
    end
  end

  describe '#find_unique' do
    context 'when given a hash of visits per page' do
      it 'selects keys that are strings with integers' do
        log_parser.parse
        log_parser.count_visits
        expect(log_parser.find_unique).to include("/about/2" => 90)
        expect(log_parser.find_unique).not_to include("/home" => 78)
      end
    end
  end

  describe '#sort' do
    context 'when given an array of pages and number of visits' do
      it 'sorts the array by visits in a descending order' do
        log_parser.parse
        log_parser.count_visits
        log_parser.find_unique
        expect(log_parser.sort.max).to eq([["/contact", 89], ["/index", 82], ["/about", 81], ["/home", 78]])
        expect(log_parser.sort.min).to eq([["/about/2", 90], ["/help_page/1", 80]])
      end
    end
  end
end
