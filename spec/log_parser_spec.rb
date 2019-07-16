require 'log_parser'

# As a data analyst
# so that I can organise data from a file
# I want to be able to extract individual lines from a log file

describe LogParser do
  describe '#parse' do
    context 'when given a .log file' do
      it 'returns an array with individual lines' do
        log_parser = LogParser.new
        file = "./data/webserver.log"
        expect(log_parser.parse(file)).to be_an_instance_of(Array)
      end
    end
  end
end
