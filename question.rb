class Question
  attr_accessor :firstNumber, :secondNumber

  def initialize 
    @firstNumber = rand(1..20)
    @secondNumber = rand(1..20)
  end

  def askQuestion
    "What is #{@firstNumber} plus #{@secondNumber}?"
  end
  
  def correct input
    if input == @firstNumber + @secondNumber
      true
    else
      false
    end
  end
end
