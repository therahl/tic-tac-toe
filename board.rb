class Board

  attr_reader :board

  def initialize
    @board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
    @turns = 0
  end

  def make_turn(x, y, player)
    if get_mark(x,y)
      return false
    else
      set_mark(x, y, player.mark)
      @turns += 1
    end
  end

  def game_over?
    @turns == 9
  end

  def winning_move(player)
    horizontal_win(player.mark) || vertical_win(player.mark) || diagonal_win(player.mark)
  end

  private

  def horizontal_win(mark)
    @board.detect do |row|
      row.uniq == [mark]
    end
  end

  def vertical_win(mark)
    (0..2).detect do |i|
      @board.map {|row| row[i]}.uniq == [mark]
    end
  end

  def diagonal_win(mark)
    [@board[0][0], @board[1][1], @board[2][2]].uniq == [mark] ||
    [@board[0][2], @board[1][1], @board[2][0]].uniq == [mark]
  end

  def set_mark(x, y, mark)
    @board[y][x] = mark
  end

  def get_mark(x, y)
    @board[y][x]
  end

end
