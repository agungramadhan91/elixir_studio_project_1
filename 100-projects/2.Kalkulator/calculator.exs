defmodule Calculator do
  def operate(:add, a, b), do: a + b
  def operate(:sub, a, b), do: a - b
  def operate(:mul, a, b), do: a * b
  def operate(:div, _a, 0), do: IO.puts("Cannot divide by 0!")
  def operate(:div, a, b), do: div(a, b)

  def parse_operator("+"), do: :add
  def parse_operator("-"), do: :sub
  def parse_operator("*"), do: :mul
  def parse_operator("/"), do: :div
  def parse_operator("_"), do: :unknown

  def run do
    IO.puts("KALKULATOR DASAR")
    IO.puts("====================================")

    a = IO.gets("Masukkan angka ke-1: ") |> String.trim() |> String.to_integer()
    o = IO.gets("Pilih operator (+, -, /, *): ") |> String.trim() |> parse_operator()
    b = IO.gets("Masukkan angka ke-2: ") |> String.trim() |> String.to_integer()

    result =
      case o do
        :unknown -> "Opetaor unindentified"
        _ -> operate(o, a, b)

      end

    IO.puts("Result: #{result}")
  end
end

Calculator.run()
