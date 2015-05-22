class Game

  attr_accessor :game_board

  def initialize
    setup_board
  end

  def setup_board
    @game_board = [['-','-','-'],
                   ['-','-','-'],
                   ['-','-','-']]
  end

  def print_board
    rows = @game_board.map do |row|
      row.join " | "
    end
    puts rows.join("\n----------\n")
  end

  def play x, y
    @game_board[y-1][x-1] = "X"
  end

  def print_help
    puts "Commands are (n)ew, (h)elp, (e)xit, (#, #) to place x"
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
        play(x,y)
      end
      print_board
      puts "Enter Command:"
      input = gets.chomp
      system "clear" or system "cls"
    end

  end

end

Game.new.run


# player is X computer is O
