
class Player
  def play_turn(warrior)
    # cool code goes here
    dir = warrior.direction_of_stairs
    warrior.walk!(dir)
  end
end
