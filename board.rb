class Board

  attr_reader :board

  def intitalize
    @board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
    @turns = 0
  end

  def make_turn(x, y, player)
    unless get_mark(x,y)
      set_mark(x, y, player.mark)
      @turns += 1
    end
  end

  def game_over?
    winning_move || @turns == 8
  end

  def winning_move
    horizon_win || vertical_win || diagonal_win
  end

  private

  def horizontal_win(mark)
    0..2.each do |x|
      counter = 0
      0..2.each do |y|
        break if @board[x][y].nil?
        return false unless @board[x][y] == mark
        counter += 1
        return true if counter == 2
      end
    end
    return true
  end

  def vertical_win(mark)
    x = 0
    0..2.each do |num|
      if @board[x][y].nil?
        x = 0
        next
      end
      return false unless @board[x][y] == mark
      x = y + 1
      return true if x == 2
    end
    return true
  end

  def diagonal_win
  end

  def set_mark(x, y, mark)
    @board[x][y] = mark
  end

  def get_mark(x, y)
    @board[x][y]
  end

end
