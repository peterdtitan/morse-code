class MorseCodeConverter
  MORSE_CODE = {
    'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.',
    'F' => '..-.', 'G' => '--.', 'H' => '....', 'I' => '..', 'J' => '.---',
    'K' => '-.-', 'L' => '.-..', 'M' => '--', 'N' => '-.', 'O' => '---',
    'P' => '.--.', 'Q' => '--.-', 'R' => '.-.', 'S' => '...', 'T' => '-',
    'U' => '..-', 'V' => '...-', 'W' => '.--', 'X' => '-..-', 'Y' => '-.--',
    'Z' => '--..', '1' => '.----', '2' => '..---', '3' => '...--', '4' => '....-', '5' => '.....',
    '6' => '-....', '7' => '--...', '8' => '---..', '9' => '----.', '0' => '-----'
  }.freeze
  def self.encode_char(char)
    MORSE_CODE[char.upcase]
  end

  def self.encode_word(word)
    word.chars.map { |char| encode_char(char) }.join(' ')
  end

  def self.encode(message)
    message.split.map { |word| encode_word(word) }.join('   ')
  end

  def self.decode_char(morse_char)
    MORSE_CODE.key(morse_char)
  end

  def self.decode_word(morse_word)
    morse_word.split.map { |morse_char| decode_char(morse_char) }.join
  end

  def self.decode(message)
    message.split('   ').map { |morse_word| decode_word(morse_word) }.join(' ')
  end
end

puts "Enter 'encode' to convert text to Morse code or 'decode' to convert Morse code to text:"
conversion_type = gets.chomp.downcase
if conversion_type == 'encode'
  puts 'Enter the text to encode:'
  text = gets.chomp
  encoded_message = MorseCodeConverter.encode(text)
  puts "Encoded message: #{encoded_message}"
elsif conversion_type == 'decode'
  puts 'Enter the Morse code to decode:'
  morse_code = gets.chomp
  decoded_message = MorseCodeConverter.decode(morse_code)
  puts "Decoded message: #{decoded_message}"
else
  puts 'Invalid conversion type.'
end
