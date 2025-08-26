defmodule StringEditor do
  def start do
    input = IO.gets("Masukkan kata/kalimat: ") |> String.trim()
    menu_loop(input)
  end

  defp menu_loop(input) do
    IO.puts("""
    \n=== Menu Manipulasi String ===
    Input sekarang: "#{input}"
    1. Ubah ke huruf besar (upcase)
    2. Ubah ke huruf kecil (downcase)
    3. Balik string (reverse)
    4. Pecah jadi graphemes (masuk submenu list)
    5. Hitung jumlah karakter
    6. Keluar
    """)

    choice = IO.gets("Pilih (1-6): ") |> String.trim()

    case choice do
      "1" ->
        new_str = String.upcase(input)
        IO.puts("Hasil: " <> new_str)
        menu_loop(new_str)

      "2" ->
        new_str = String.downcase(input)
        IO.puts("Hasil: " <> new_str)
        menu_loop(new_str)

      "3" ->
        new_str = String.reverse(input)
        IO.puts("Hasil: " <> new_str)
        menu_loop(new_str)

      "4" ->
        graphemes = String.graphemes(input)
        list_menu_loop(graphemes, input)

      "5" ->
        IO.puts("Jumlah karakter: #{String.length(input)}")
        menu_loop(input)

      "6" ->
        IO.puts("Terima kasih! Keluar...")

      _ ->
        IO.puts("Pilihan tidak valid, coba lagi.")
        menu_loop(input)
    end
  end

  # Submenu khusus manipulasi list graphemes
  defp list_menu_loop(graphemes, input) do
    IO.puts("""
    \n=== Submenu Manipulasi Graphemes (List) ===
    Input sekarang: "#{input}"
    1. Tampilkan semua graphemes
    2. Ambil elemen pertama
    3. Ambil elemen terakhir
    4. Hitung jumlah elemen
    5. Balik urutan list (bisa jadi input baru)
    6. Gabungkan kembali jadi string (bisa jadi input baru)
    7. Kembali ke menu utama
    """)

    choice = IO.gets("Pilih (1-7): ") |> String.trim()

    case choice do
      "1" ->
        IO.inspect(graphemes, label: "Hasil")
        list_menu_loop(graphemes, input)

      "2" ->
        IO.puts("Elemen pertama: #{hd(graphemes)}")
        list_menu_loop(graphemes, input)

      "3" ->
        IO.puts("Elemen terakhir: #{List.last(graphemes)}")
        list_menu_loop(graphemes, input)

      "4" ->
        IO.puts("Jumlah elemen: #{length(graphemes)}")
        list_menu_loop(graphemes, input)

      "5" ->
        new_graphemes = Enum.reverse(graphemes)
        new_str = Enum.join(new_graphemes)
        IO.inspect(new_graphemes, label: "List dibalik")
        ask_replace(new_str, input)

      "6" ->
        new_str = Enum.join(graphemes)
        IO.puts("Gabungan string: " <> new_str)
        ask_replace(new_str, input)

      "7" ->
        menu_loop(input)

      _ ->
        IO.puts("Pilihan tidak valid, coba lagi.")
        list_menu_loop(graphemes, input)
    end
  end

  # Tanya apakah user ingin mengganti input utama
  defp ask_replace(new_str, old_input) do
    choice = IO.gets("Jadikan hasil sebagai input utama? (y/n): ") |> String.trim()

    case choice do
      "y" ->
        menu_loop(new_str)

      "n" ->
        menu_loop(old_input)

      _ ->
        IO.puts("Pilihan tidak valid, kembali ke menu utama.")
        menu_loop(old_input)
    end
  end
end

StringEditor.start()
