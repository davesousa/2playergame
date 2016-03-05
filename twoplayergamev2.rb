class Question
  attr_accessor(:answer)

  def initialize
    @num1 = Random.rand(1..20)
    @num2 = Random.rand(1..20)
    @answer = @num1 + @num2
  end


  def problem
    "what is #{@num1} + #{@num2}"
  end

  def is_correct?(user_input)
     user_input == @answer

  end
end

class Player
  attr_accessor(:lives, :points, :name)

  def initialize(name, lives = 3)
    @lives = lives
    @points = 0
    @name = name
  end

  def lose
    @lives -= 1
  end

  def win
    @points += 1
  end
end

@turn = 0
@game = true

def turn
  @turn += 1
end

p "Welcome to my 2 Player math game!"
puts

p "Player 1, What is your name?"
p1 = Player.new(gets.chomp)

p "Player 2, What is your name?"
p2 = Player.new(gets.chomp)

p "Welcome #{p1.name} & #{p2.name}, lets get started."
puts



while p1.lives > 0 && p2.lives > 0
  question = Question.new

  case @turn
  when 0
    p "#{p1.name} it's your turn!"
    puts
  when 1
    p "#{p2.name} it's your turn!"
    puts
  end

  p question.problem

  input = gets.chomp.to_i

  if @turn == 0 && question.is_correct?(input)
    p "Correct!"
    p1.win
    p "#{p1.name}, you have #{p1.points} points and #{p1.lives} lives left."
    puts
    @turn +=1
  elsif @turn == 0 && !question.is_correct?(input)
    p "Wrong!"
    p1.lose
    p "#{p1.name}, you have #{p1.points} points and #{p1.lives} lives left."
    puts
    @turn +=1
  elsif @turn == 1 && question.is_correct?(input)
    p "Correct!"
    p2.win
    p "#{p2.name}, you have #{p2.points} points and #{p2.lives} lives left."
    puts
    @turn -=1
  elsif @turn == 1 && !question.is_correct?(input)
    p "Wrong!"
    p2.lose
    p "#{p2.name}, you have #{p2.points} points and #{p2.lives} lives left."
    puts
    @turn -=1
  end
end

if p1.lives > 0
  p "#{p1.name} WINS!"
  p "Game Over! The Final score is #{p1.name}: #{p1.points} #{p2.name}: #{p2.points}"
else
  p "#{p2.name} WINS!"
  p "Game Over! The Final score is #{p1.name}: #{p1.points} #{p2.name}: #{p2.points}"
end
