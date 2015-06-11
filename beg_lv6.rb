class Player

  HEALTH_DIRE = 8 # you gonna die if you keep getting hit! <==
  FULL_HEALTH = 20 # if the full health level changes, I can just change it here

  def play_turn(warrior)
      @warrior = warrior
      @health ||= @warrior.health

    if (getting_hit? == false) && injured? # not getting hit & hurt
      @warrior.rest! #heal
    elsif (@warrior.feel.empty?) # if space is empty
        if getting_hit? && dying?
          retreat
        elsif (getting_hit?)
        # space is empty & if you are getting hit(ie archer)
          @warrior.walk!
        else
          @warrior.walk! #space is empty and not getting hit
        end
    else #if space is not empty
      if @warrior.feel.captive?
        @warrior.rescue!
      else
        @warrior.attack!
      end
    end #double statement

    @health = @warrior.health
  end #play_turn

  def retreat
    @warrior.walk!(:backward)
  end

  def getting_hit?#(warrior)
    @warrior.health < @health
    # returns true if getting hit, false if not
  end

  def dying?#(warrior)
    (@warrior.health <= HEALTH_DIRE)
    # if health is really REALLY low
  end

  def injured?#(warrior)
    @warrior.health != FULL_HEALTH # will return true if injured
  end


end # player class
