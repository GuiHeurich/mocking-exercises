require 'till'

describe Till do

  let(:mockreceipt) { double (:mockreceipt) }
  let(:amount) { double (:amount) }

  describe '#print_receipt' do
    it 'returns expected value' do
      allow(mockreceipt).to receive(:new) { Receipt.new }
      # allow(mockreceipt).to receive(:print) { 0 }
      till = Till.new(mockreceipt)

      expect { till.print_receipt }.to output("You paid 0. THANKS SO MUCH!\n").to_stdout
    end
  end
end
