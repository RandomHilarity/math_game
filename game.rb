class Game
  def initialize
    puts '2-Player Math Game'
    @player1 = Players.new('Player 1')
    @player2 = Players.new('Player 2')
    @end_game = false
    @player1.turn = true
  end

  def question
    question = Question.new
    @question = question.question
    @answer = question.answer
    puts '----- NEW TURN -----'
    if @player1.turn
      puts "Player 1: #{@question}"
    else
      puts "Player 2: #{@question}"
    end
  end

  def answer_checker
    if @player1.turn
      if gets.chomp.to_i == @answer
        puts 'YES! You are correct.'
        puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
        @player1.turn = false
      else
        puts 'Seriously? No!'
        @player1.life -= 1
        puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
        @player1.turn = false
        win
      end
    else
      if gets.chomp.to_i == @answer
        puts 'YES! You are correct.'
        puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
        @player1.turn = true
      else
        puts 'Seriously? No!'
        @player2.life -= 1
        puts "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
        @player1.turn = true
        win
      end
    end
  end

  def win
    if @player1.life == 0
      puts "Player 2 wins, remaining life: #{@player2.life}/3."
      @end_game = true
    elsif @player2.life == 0
      puts "Player 1 wins, remaining life: #{@player1.life}/3."
      @end_game = true
    end
  end

  def play
    while @end_game == false
      question
      answer_checker
    end
  end
end
