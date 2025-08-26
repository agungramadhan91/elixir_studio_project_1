# Fungsi (def, module, parameter)

defmodule Kalkulator do
  def tambah(a, b), do: a + b
  def kurang(a, b), do: a - b
  def kali(a, b), do: a * b
  def bagi(a, b), do: div(a, b)
end

IO.puts(Kalkulator.tambah(3,5))
IO.puts(Kalkulator.kurang(3,5))
IO.puts(Kalkulator.kali(3,5))
IO.puts(Kalkulator.bagi(3,5))
