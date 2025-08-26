#String

defmodule StringFunc do
	def menus(number) do
		case number do
			1 -> manipulator(:length)
			2 -> manipulator(:upcase)
			3 -> manipulator(:downcase)
			4 -> manipulator(:replace)
			5 -> manipulator(:graph)
			_ -> "The menu does not exist"
		end
	end

	def manipulator(atom) do

		IO.puts("Masukkan kata/kalimat")
		input = IO.gets("> ") |> String.trim()
		
		case atom do
			:length ->
				String.length(input)
			:upcase -> 
				String.upcase(input)
			:downcase ->
				String.downcase(input)
			:replace ->
				IO.puts("Masukkan kata pengganti")
				rplc = IO.gets("> ")
				String.replace(input,"," ,rplc )
			:graph ->
				String.graphemes(input)	
			_ -> "none"	
		end
	end
	
	def run do
		IO.puts("The power of String")
		IO.puts("===========================")

		IO.puts("Pilih jenis manipulasi string:")
		IO.puts("""
		1.Hitung karakter
		2.Ubah ke huruf capital
		3.Ubah ke huruf kecil
		4.Ubah kata dalam kalimat
		5.Ubah ke bentuk List
		""")

		menu = IO.gets("Pilih angka > ") 
			|> String.trim()
			|> String.to_integer()
			|> menus()
		
		IO.puts("Hasilnya #{inspect menu}")
	end
end

StringFunc.run()
