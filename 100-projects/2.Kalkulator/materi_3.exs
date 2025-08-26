IO.puts "Masukan angka pertama"
a = IO.gets("> ") |> String.trim() |> String.to_integer()

IO.puts("Masukan angka kedua")
b = IO.gets("> ") |> String.trim() |> String.to_integer()

IO.puts("Hasilnya adalah #{a + b}")
