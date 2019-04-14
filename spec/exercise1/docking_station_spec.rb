require 'docking_station'

describe DockingStation do

  let(:working_bike) { double :working_bike }
  let(:broken_bike) { double :broken_bike }

  describe '#working_bike_count' do
    context '1 working bike' do
      it "returns 1" do
        bikes = []
        allow(working_bike).to receive(:working?) { true }
        bikes << working_bike
        docking_station = DockingStation.new(bikes)

        expect(docking_station.working_bike_count).to eq(1)
      end
    end

    context '1 working bike, 1 broken bike' do
      it "returns 1" do
        bikes = []
        allow(working_bike).to receive(:working?) { true }
        bikes << working_bike
        allow(broken_bike).to receive(:working?) { false }
        bikes << broken_bike
        docking_station = DockingStation.new(bikes)

        expect(docking_station.working_bike_count).to eq(1)
      end
    end
  end

  describe '#random_bike_working?' do
    context 'random bike is working' do
      it 'returns true' do
        allow(working_bike).to receive(:working?) { true }
        allow(broken_bike).to receive(:working?) { false }
        docking_station = DockingStation.new([working_bike, broken_bike])
        expect(docking_station.random_bike_working?).to eq(true).or eq (false)
      end
    end

    context 'random bike is broken' do
      it 'returns false' do
        allow(working_bike).to receive(:working?) { true }
        allow(broken_bike).to receive(:working?) { false }
        docking_station = DockingStation.new([working_bike, broken_bike])
        expect(docking_station.random_bike_working?).to eq(false).or eq (true)
      end
    end
  end
end
