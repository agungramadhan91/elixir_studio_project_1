# BMI FORMULA ============================
# tinggi_m = tinggi_cm / 100
# berat / :math.pow(tinggi_m, 2)

defmodule BMI do

  def calculator(berat, tinggi) do
    tinggi_m = tinggi / 100

    berat / :math.pow(tinggi_m, 2)
  end

  def run do
    IO.puts("Masukkan berat dalam Kilogram")
    berat   = IO.gets("> ") |> String.trim() |> String.to_integer()
    IO.puts("Masukkan tinggi dalam CM")
    tinggi  = IO.gets("> ") |> String.trim() |> String.to_integer()

    result = calculator(berat, tinggi)
    IO.puts("Hasil BMI kamu adalah #{result}")
  end
end

BMI.run()
