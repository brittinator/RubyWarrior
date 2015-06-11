empty & healthy
  * walk

occupied & healthy
  * attack

empty & hurt
  * heal

occupied & hurt
  * heal


*enemies
  thick sludge - 1 space, 24 power
  archer - 2 space

  Set @health to your current health at the end of the turn.
  If this is greater than your current health next turn then you know you're taking damage and shouldn't rest.

---------------------------------------------------
class Player

  HEALTH_DIRE = 8 # you gonna die if you keep getting hit! <==
  FULL_HEALTH = 20 # if the full health level changes, I can just change it here

  def play_turn(warrior)
      @warrior = warrior
      @health ||= @warrior.health

    if (getting_hit? == false) && injured? # not getting hit & hurt
      @warrior.rest! #heal
    elsif (@warrior.feel.empty?) # if space is empty
        if (getting_hit?)
        # space is empty & if you are getting hit(ie archer)
          @warrior.walk!
        else
          @warrior.walk! #space is empty and not getting hit
        end
    else #if space is not empty
       @warrior.attack!
    end #double statement

    @health = @warrior.health
  end #play_turn

  # def retreat?#(warrior)
  #   if (@warrior.health < HEALTH_DIRE) && (getting_hit?)
  #     # if you are really low on health AND you're getting hit
  #     @warrior.walk(:backwards)
  #   end
  # end

  def getting_hit?#(warrior)
    @warrior.health < @health
    # returns true if getting hit, false if not
  end

  # def dying?#(warrior)
  #   (@warrior.health < HEALTH_DIRE)
  #   # if health is really REALLY low
  # end

  def injured?#(warrior)
    @warrior.health != FULL_HEALTH # will return true if injured
  end


end # player class
