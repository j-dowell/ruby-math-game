require './player.rb'
require './question.rb'

class Game
  attr_accessor :currentPlayer
  def initialize
    @gameIsRunning = true
    @players = []
    @playerTimer = 15
  end

  def nextPlayer
    if @currentPlayer == @players[0]
      @currentPlayer = @players[1]
    else
      @currentPlayer = @players[0]
    end
  end

  def gameIsRunning
    if @players[0].lives <= 0 || @players[1].lives <= 0 
      false
    else
      true
    end
  end

  def winner 
    if @players[0].lives > @players[1].lives
      "#{@players[0].name} Wins!"
    else
      "#{@players[1].name} Wins!"
    end
  end

  def reduceTime
    @playerTimer -= 1
  end

  def correctAnswer 
    puts "Nice job #{currentPlayer.name}"
    puts @currentPlayer.showLives        
    puts "*-----------------NEXT PLAYER-----------------*"
  end

  def incorrectAnswer
    @currentPlayer.loseLife
    puts "#{@currentPlayer.name} YOU LOST A LIFE!! -  #{@currentPlayer.showLives}"
    puts "*-----------------NEXT PLAYER-----------------*"
  end

  def nameInput
    puts "Player 1: Enter your name"
    name1 = gets.chomp
    player1 = Player.new(name1)
    puts "Player 2: Enter your name"
    name2 = gets.chomp
    player2 = Player.new(name2)
    @players.push(player1, player2)
    @currentPlayer = @players[0]
  end


  def play
    nameInput
    while gameIsRunning

      question = Question.new()
      puts "ROUND TIMER - #{@playerTimer} SECONDS"
      puts "#{@currentPlayer.name}: #{question.askQuestion}"
      startTime = Time.now
      input = gets.chomp.to_i
      endTime = Time.now
      totalTime = endTime - startTime
      puts "You took #{totalTime.round(1)} seconds"
      if question.correct(input) == true && totalTime < @playerTimer
        correctAnswer
      else
        incorrectAnswer
      end
      reduceTime
      nextPlayer
    end
   puts winner
end


end



g = Game.new
g.play
