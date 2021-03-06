class Commander
  attr_reader :commands

  METHODS = [:clear, :reset, :pen_up, :pen_down, :color, :turn_left, :turn_right, :forward, :backward, :move_to]

  def initialize(executor = nil)
    if executor
      @executor = executor
    else
      @commands = []
    end
  end

  def <<(command)
    if @executor
      @executor.method(command.first).call(*command[1..-1])
    else
      @commands << command
    end
  end

  def clear
    self << [:clear]
  end

  def reset
    self << [:reset]
  end

  def turn_left(digree)
    self << [:turn_left, digree]
  end

  def turn_right(digree)
    self << [:turn_right, digree]
  end

  def pen_down
    self << [:pen_down]
  end

  def pen_up
    self << [:pen_up]
  end

  def color(color)
    self << [:color, color]
  end

  def forward(dist)
    self << [:forward, dist]
  end

  def backward(dist)
    self << [:forward, -dist]
  end

  def move_to(x, y)
    self << [:move_to, x, y]
  end
end
