# 4. Konversi Suhu: Rumus
# ===========================================
# Celcius → Fahrenheit: F = (C * 9/5) + 32
# Fahrenheit → Celcius: C = (F - 32) * 5/9
# Celcius → Kelvin: K = C + 273.15
# Kelvin → Celcius: C = K - 273.15
# Fahrenheit → Kelvin: (F - 32) * 5/9 + 273.15
# Kelvin → Fahrenheit: (K - 273.15) * 9/5 + 32

defmodule Converter do
	def c_to_f(c), do: (c * 9 / 5) + 32 <> " Fahrenheit"
	def f_to_c(f), do: (f - 32) * 5 / 9 <> " Celcius"

	def run do
		IO.puts("Menu Konversi Suhu:")
		IO.puts"""
			1.Celcius ke Fahrenheit
			2.Fahrenheit ke Celcius
		"""
		IO.puts("Silahkan pilih nomor:")
		choose = IO.gets("> ") |> String.trim()
		IO.puts("Silahkan masukan angka untuk diubah:")
		number = IO.gets("> ") |> String.trim() |> String.to_integer() 

		result = 
			case choose do
			"1" -> c_to_f(number)
			"2" -> f_to_c(number)
			_ -> "Tidak ada menu tersebut"
			end

		IO.puts("Hasilnya #{result}")
		
	end
end

Converter.run()
