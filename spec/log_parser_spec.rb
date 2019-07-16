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
end
