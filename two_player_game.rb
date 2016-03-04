@p1_score = 3
@p2_score = 3
@turn = 2

def lose_1
  @p1_score -= 1
end

def lose_2
  @p2_score -= 1
end

def question
  "what is #{@num1} + #{@num2}"
end

def answer
  @answer = @num1 + @num2
end

def turn
  @turn += 1
end

def game
    while @p1_score > 0 and @p2_score > 0

        if @turn.even?
          @num1 = Random.rand(1..20)
          @num2 = Random.rand(1..20)

          p "Player 1 go!"
          p question
          user_input = gets.chomp.to_i

          if user_input == answer
            p "correct"
          else
            p "wrong"
            lose_1
            p "Player 1, You have #{@p1_score} lives left"
        end
        turn
      else
        @num1 = Random.rand(1..20)
        @num2 = Random.rand(1..20)

        p "Player 2 go!"
        p question
        user_input = gets.chomp.to_i

        if user_input == answer
          p "correct"
        else
          p "wrong"
          lose_2
          p "Player 2, You have #{@p2_score} lives left"
        end
        turn
      end
    end
    if @p1_score == 0
      puts "Player 1 sucks, you lose"
      puts "Player 2 WINS!"
    else
      puts "Player 1 sucks, you lose"
      puts "Player 2 WINS!"
    end
end

game
