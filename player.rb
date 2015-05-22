class Player

  attr_reader :name, :mark

  def initialize(name)
    @name = name
    @mark = (name == 'computer') ? 'X' : 'O'
  end

end
