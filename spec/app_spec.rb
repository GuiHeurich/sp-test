require 'app'

describe App do

  let(:file) { "./data/webserver.log" }
  subject(:app) { described_class.new }

  describe '#parse' do
    context 'when given a weblog file' do
      it 'returns lists of most viewed pages' do
        expect { app.parse(file) }.to output.to_stdout
      end
    end
  end
end
