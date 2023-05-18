class MorseCodeConverter
    MORSE_CODE = {
      "A" => ".-", "B" => "-...", "C" => "-.-.", "D" => "-..", "E" => ".",
      "F" => "..-.", "G" => "--.", "H" => "....", "I" => "..", "J" => ".---",
      "K" => "-.-", "L" => ".-..", "M" => "--", "N" => "-.", "O" => "---",
      "P" => ".--.", "Q" => "--.-", "R" => ".-.", "S" => "...", "T" => "-",
      "U" => "..-", "V" => "...-", "W" => ".--", "X" => "-..-", "Y" => "-.--",
      "Z" => "--.."
    }
  
    def self.encode_char(char)
      MORSE_CODE[char.upcase]
    end
  
    def self.encode_word(word)
      word.chars.map { |char| encode_char(char) }.join(" ")
    end
  
    def self.encode(message)
      message.split.map { |word| encode_word(word) }.join("   ")
    end
  
    def self.decode_char(morse_char)
      MORSE_CODE.key(morse_char)
    end
  
    def self.decode_word(morse_word)
      morse_word.split(" ").map { |morse_char| decode_char(morse_char) }.join
    end
  
    def self.decode(message)
      message.split("   ").map { |morse_word| decode_word(morse_word) }.join(" ")
    end
  end
