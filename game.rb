require 'rubygems'
require 'byebug'
require './board'
require './player'
class Game

  attr_accessor :game_board

  def initialize
    setup_board
  end

  def setup_board
    @game_board = Board.new
    @player_one = Player.new('person')
    @player_two = Player.new('computer')
  end

  def print_board
    rows = @game_board.board.map do |row|
      row.map{ |i| i ? i : "-" }.join " | "
    end
    puts rows.join("\n----------\n")
  end

  def play x, y, player=@player_one
    @game_board.make_turn(y-1,x-1, player)
  end

  def print_help
    puts "Commands are (n)ew, (h)elp, (e)xit, (#, #) to place x"
  end

  def check_win(player)
    if @game_board.winning_move(player)
      game_over "#{player.name} Wins"
    end
  end

  def game_over(condition)
    print_board
    puts condition
    puts "Start again?"
    gets
    setup_board
  end

  def run
    system "clear" or system "cls"
    input = ""
    print_help
    while !input.match(/^e/i) do
      if input.match(/^n/i)
        setup_board
      elsif input.match(/^h/i)
        print_help
      elsif input.match(/\d,\s*\d/)
        x,y = input.split(',').map{ |i| i.to_i }
        turn = play(x,y)
        unless turn
          puts "That's not a valid move"
        end
      else
        puts "I don't think so Dave"
      end
      check_win @player_one
      if @game_board.game_over?
        game_over "It's a tie."
      end
      if turn
        begin
          t2 = play(rand(3) + 1, rand(3) + 1, @player_two)
        end while(!t2)
      end
      check_win @player_two
      print_board
      puts "Enter Command:"
      input = gets.chomp
      system "clear" or system "cls"
    end

  end

end

Game.new.run


# player is X computer is O
