# Pattern Matching & Guards

defmodule Kalkulator do
  def tambah(a, b), do: a + b
  def kurang(a, b), do: a - b
  def kali(a, b), do: a * b

  def bagi(_a, 0), do: IO.puts("Tidak bisa membagi dengan nol")
  def bagi(a, b) when is_number(a) and is_number(b), do: div(a, b)
end

IO.puts(Kalkulator.tambah(3,5))
IO.puts(Kalkulator.kurang(3,5))
IO.puts(Kalkulator.kali(3,9))
IO.puts(Kalkulator.bagi(b,0))
