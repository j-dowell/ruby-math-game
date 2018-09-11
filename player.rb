class Player
  attr_accessor :name, :lives
  def initialize name
    @name = name
    @lives = 3
  end

  def loseLife 
    @lives -= 1
  end

  def showLives
    "#{@lives}/3 lives left"
  end
  
end
