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

describe Board do 
  before :each do 
    @board = Board.new
  end  

  describe "#new" do 
    it "returns a new player object" do 
      expect(@board).to be_an_instance_of(Board)
    end
  end

  describe "#spaces" do 
    it "returns an Array" do 
      expect(@board.spaces.size).to eql 42
    end
  end

  describe "#space_free?" do 
    it "returns false when space is taken" do 
      board = Board.new
      board.spaces[0] = "red"
      expect(board.space_free?(0)).to be false
    end

    it "returns true when space is not taken" do 
      expect(@board.space_free?(0)).to be true
    end
  end

  describe "#place_piece" do 
    it "places color on space" do 
      expect{@board.place_piece(0, "red")}.to change{@board.spaces[0]}.from(nil).to("red")
    end
  end

  describe "#winner" do 
    it "checks to see if the board has a winner" do 

    end
  end

  describe "#tie?" do
    it "returns true if no empty spaces and no winner" do 

    end
  end
end

describe Game do
  before :each do 
    @game = Game.new
    @current_turn = 1
  end

  describe "#new" do 
    it "returns a new game object" do 
      expect(@game).to be_an_instance_of(Game)
    end
  end

  describe "#play_game" do 

  end

  describe "#move" do 
    

  end

  describe "#print_game_result" do 

  end

  describe "#current_player" do 
    it "returns player1" do 
      expect(@game.current_player).equal?(@player1)
    end

    it "returns player2" do 
      @current_turn += 1
      expect(@game.current_player).equal?(@player2)
    end
  end
end







