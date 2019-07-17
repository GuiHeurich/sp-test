require 'printer'

describe Printer do

  subject(:printer) { described_class.new }

  describe '#print' do
    context 'when given an array' do
      it 'prints out the elements' do
        list = [["/about/2", 90], ["/help_page/1", 80]]
        expect(printer.print(list)).to eq("/about/2 90 /help_page/1 80 ")
      end
    end
  end
end
