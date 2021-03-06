require_relative "spec_helper"

describe "Reservation class" do
  before do
    @room = Hotel::Room.new(1)
    @reservation = Hotel::Reservation.new(room: @room, start_date: "2019-3-15", end_date: "2019-3-20")
  end

  describe "Reservation instantiation" do
    it "is an instance of a Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end

    it "raises an Argument if end_date is before start_date" do
      expect {
        Hotel::Reservation.new(room: @room, start_date: "2019-3-15", end_date: "2019-3-13")
      }.must_raise ArgumentError
    end

    it "raises an Argument if end_date is same as start_date" do
      expect {
        Hotel::Reservation.new(room: @room, start_date: "2019-3-15", end_date: "2019-3-15")
      }.must_raise ArgumentError
    end
  end

  describe "Caclulate total cost" do
    it "accurately calculates the total cost for a single reservation" do
      result = @reservation.calculate_cost

      expect(result).must_equal 800
    end
  end
end
