
require './player'
require './question'

class Game
  def initialize   
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @current_player = @player1
  end

  def current_player_turn
    @current_player == @player1 ? 'Player 1' : 'Player 2'
  end

  def switch_turn
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def start
    loop do

      question_ob = Question.new
      question=question_ob.new_question
      puts " #{current_player_turn}: #{question}"
      ans = question_ob.answer_question()

      if ans
        puts "#{current_player_turn}: Yes, you are correct!"
        @current_player.live += 1 unless @current_player.live == 3
        puts "#{current_player_turn}: #{@current_player.live}/3"
        
      else
        puts "#{current_player_turn}: Seriously, no!"
        @current_player.live -= 1 unless @current_player.live.zero?
        puts "#{current_player_turn}: #{@current_player.live}/3"
      end

      break if @current_player.live == 0
      switch_turn
    end

    if @current_player.live.zero?
      puts "#{current_player_turn} has run out of lives!"
    end
  end
end

