require 'spec_helper'

describe Player do 
  before :each do 
    @player = Player.new("Color")
  end

  describe "#new" do 
    it "returns a new player object" do 
      expect(@player).to be_an_instance_of(Player) 
    end

    it "should raise" do
      expect {Player.new}.to raise_error(ArgumentError)
    end
  end

  describe "#color" do 
    it "returns correct color do" do
      expect(@player.color).to eql "Color"
    end
  end
end