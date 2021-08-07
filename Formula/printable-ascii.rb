class PrintableAscii < Formula
  desc "Output all printable ASCII characters in various representations and formats"
  homepage "https://github.com/sdball/printable-ascii"
  url "https://github.com/sdball/printable-ascii/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b5b284bad7af99e6a5ab31611aa2ddea57f9417d7085c1038d406b4e51d2a921"
  license "MIT"

  def install
    bin.install "bin/printable-ascii"
  end

  test do
    ascii_json = [
      { "character" => " " },
      { "character" => "!" },
      { "character" => "\"" },
      { "character" => "#" },
      { "character" => "$" },
      { "character" => "%" },
      { "character" => "&" },
      { "character" => "'" },
      { "character" => "(" },
      { "character" => ")" },
      { "character" => "*" },
      { "character" => "+" },
      { "character" => "," },
      { "character" => "-" },
      { "character" => "." },
      { "character" => "/" },
      { "character" => "0" },
      { "character" => "1" },
      { "character" => "2" },
      { "character" => "3" },
      { "character" => "4" },
      { "character" => "5" },
      { "character" => "6" },
      { "character" => "7" },
      { "character" => "8" },
      { "character" => "9" },
      { "character" => ":" },
      { "character" => ";" },
      { "character" => "<" },
      { "character" => "=" },
      { "character" => ">" },
      { "character" => "?" },
      { "character" => "@" },
      { "character" => "A" },
      { "character" => "B" },
      { "character" => "C" },
      { "character" => "D" },
      { "character" => "E" },
      { "character" => "F" },
      { "character" => "G" },
      { "character" => "H" },
      { "character" => "I" },
      { "character" => "J" },
      { "character" => "K" },
      { "character" => "L" },
      { "character" => "M" },
      { "character" => "N" },
      { "character" => "O" },
      { "character" => "P" },
      { "character" => "Q" },
      { "character" => "R" },
      { "character" => "S" },
      { "character" => "T" },
      { "character" => "U" },
      { "character" => "V" },
      { "character" => "W" },
      { "character" => "X" },
      { "character" => "Y" },
      { "character" => "Z" },
      { "character" => "[" },
      { "character" => "\\" },
      { "character" => "]" },
      { "character" => "^" },
      { "character" => "_" },
      { "character" => "`" },
      { "character" => "a" },
      { "character" => "b" },
      { "character" => "c" },
      { "character" => "d" },
      { "character" => "e" },
      { "character" => "f" },
      { "character" => "g" },
      { "character" => "h" },
      { "character" => "i" },
      { "character" => "j" },
      { "character" => "k" },
      { "character" => "l" },
      { "character" => "m" },
      { "character" => "n" },
      { "character" => "o" },
      { "character" => "p" },
      { "character" => "q" },
      { "character" => "r" },
      { "character" => "s" },
      { "character" => "t" },
      { "character" => "u" },
      { "character" => "v" },
      { "character" => "w" },
      { "character" => "x" },
      { "character" => "y" },
      { "character" => "z" },
      { "character" => "{" },
      { "character" => "|" },
      { "character" => "}" },
      { "character" => "~" },
    ]

    assert_equal ascii_json, JSON.parse(shell_output("#{bin}/printable-ascii --json"))
  end
end
