class Array
  def sum(start = 0)
    inject(start, &:+)
  end

  def multiply
    inject(:*)
  end

  def pretty_print(start = 0)
    join(', ')
  end
end
