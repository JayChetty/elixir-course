defmodule RecursionBasic do
  def countdown(0), do: IO.puts "Blast Off"
  def countdown(n) do
    IO.puts n
    countdown( n - 1 )
  end
end

defmodule TailCall do
  def ten_times(0), do: 0
  def ten_times(n) do
    10 + ten_times(n - 1) #not tail optimised
  end
end

defmodule TailCallOpt do
  def ten_times(n), do: ten_times(n,0)
  def ten_times(0, acc), do: acc
  def ten_times(n, acc) do
    ten_times(n - 1, acc + 10)
  end
end

defmodule Reduce do
  def sum([], acc), do: acc
  def sum([head | tail], acc ), do: sum(tail, acc + head)
end

defmodule Mapper do
  def square([]), do: []
  #not tail call optimized
  def square( [ head | tail ]) , do: [ head * head | square(tail) ]
end

defmodule MapperOpt do
  def square([], acc), do: acc
  #not tail call optimized
  def square( [ head | tail ], acc) do
    square( tail, acc ++ [head * head] )
  end
end
a = fn(x) -> x * x end
IO.inspect MapperOpt.square([1,2,3,4], [])
# IO.puts Reduce.sum([1,2,3], 0)
# Recursion.countdown(5)

# Tail call optimisation.  Tail call if recall is last thing it does.
