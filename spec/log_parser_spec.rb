require 'log_parser'

describe LogParser do
  describe '#parse' do
    context 'when given a .log file' do
      it 'returns an array with individual lines' do
        log_parser = LogParser.new
        file = "./data/webserver.log"
        expect(log_parser.parse(file)).to be_an_instance_of(Array)
      end

      # As a data analyst
      # so that I can organise my data
      # I want each line to show only the page visited
      it 'shows only the page name in each line' do
        log_parser = LogParser.new
        file = "./data/webserver.log"
        expect(log_parser.parse(file)[0]).to eq("/help_page/1")
      end
    end
  end
end
