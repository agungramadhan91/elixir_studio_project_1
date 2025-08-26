2defmodule StringEditor do

	def input do
		IO.puts("Masukkan kata atau kalimat")
		text = IO.gets("> ") |> String.trim()
		{:ok, text}
	end

	def canvas() do

	end

	def edit(text) do
		IO.puts("Masukkan filter")
		IO.puts("""
		1. length
		2. upcase
		3. downcase
		""")
		filter = IO.gets("> ") |> String.trim()
	
		case filter do
			"1" -> String.length(text)
			"2" -> String.upcase(text)
			_ -> IO.puts "Unknown filter"
		end	
	end
	
	def run do
		{:ok, text} = input()
		
		if text == "stop" do
			IO.puts("Terima kasih")
		else
			changed = edit(text)
			
			IO.puts("Hasilnya #{inspect changed}")
			IO.puts("========================\n")
			run()
		end
	end
end

StringEditor.run()
