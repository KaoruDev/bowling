class BowlingGame
  attr_accessor :rolls, :frame, :extra_frame

  def initialize
    @rolls = []
    @frame = 1
    @extra_frame = 0
    @total_score  = 0
    @current_roll = 0
  end

  # Record a roll in the game.
  #
  # pins - The Integer number of pins knocked down in this roll.
  #
  # Returns nothing.
  def roll(pins)
    @rolls.push(pins)
  end

  # Returns the Integer score for this game. Expects to be run after all rolls
  # for the game have been recorded.
  def score
    p @rolls
    while @current_roll < @rolls.size # since zero indexed.
      init_roll

      if strike?
        score_strike
      elsif spare?
        score_spare
      else
        score_frame
      end
    end

    return @total_score
  end

  private

  # Initialize values for roll and next_roll.
  #
  # Returns nothing.
  def init_roll
    @roll      = @rolls[@current_roll]
    @next_roll = @rolls[@current_roll + 1]
  end

  # Returns true if the current roll is a strike, false otherwise.
  def strike?
    @roll == 10
  end

  # Returns true if current roll is a spare. false otherwise
  def spare?
    @roll + @next_roll == 10
  end

  # Scores a strike frame, and adds it to the total score for the game.
  #
  # Returns nothing.
  def score_strike
    if frame < 10
      @total_score += 10 + @next_roll + @rolls[@current_roll + 2]
      @frame += 1
    else
      @total_score += 10
      @extra_frame += 1
      if @extra_frame == 3
        @current_roll = @rolls.size
      end
    end
    @current_roll += 1
  end

  # Scores a spare frame, and adds it to the total score for the game.
  #
  # Returns nothing.
  def score_spare
    @total_score += 10 + @rolls[@current_roll + 2]
    @current_roll += 2
    @frame += 1
  end

  # Adds a score of < 10 to the total score. Returns nothing.
  def score_frame
    @total_score += @roll + @next_roll
    @current_roll += 2
    @frame += 1
  end
end