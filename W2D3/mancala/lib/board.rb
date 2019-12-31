require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @current_player = @player1
    @cups = Array.new(14){[]}
    self.place_stones
  end 

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times{cup << :stone} 
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos >= 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    pickup = @cups[start_pos]
    @cups[start_pos] = []
    pos = start_pos 
    until pickup.empty?
      pos += 1
      pos = 0 if pos > 13

      if pos == 6 
        @cups[6] << pickup.shift if current_player_name == @player1
      elsif pos == 13
        @cups[13] << pickup.shift if current_player_name == @player2
      else 
        @cups[pos] << pickup.shift
      end 
    end 
    render
    self.next_turn(pos)
 
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      :prompt
      # debugger
    elsif self.cups[ending_cup_idx].empty?
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    count1 = self.cups[6].count
    count2 = self.cups[13].count 
    if count1 == count2
      :draw
    else 
      count1 > count2 ? @player1 : @player2
    end
  end
end
