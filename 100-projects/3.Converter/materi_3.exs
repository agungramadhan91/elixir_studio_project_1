# Private Function

defmodule Math do
	def square(a), do: multiply(a, a)

	def multiply(x, y), do: IO.puts x * y
end

Math.square(8)
