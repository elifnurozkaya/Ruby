
def ceasar_cipher(string,key)
  small_alphabet = 'abcdefghijklmnopqrstuvwxyz'
  big_alphabet ='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  letters = string.split("")
  crypted_letters = letters.map do |letter|
    if small_alphabet.split("").include?(letter)
      if (letter.ord + key) > 122
        letter = ((letter.ord%123) + 97).chr
      else
        letter = (letter.ord + key).chr
      end
    elsif big_alphabet.split("").include?(letter)
      if (letter.ord + key) > 90
        letter = ((letter.ord%91) + 65).chr
      else
        letter = (letter.ord + key).chr
      end
    else
      letter
    end
  end
  
  return crypted_letters.join("")
end

puts ceasar_cipher("What a nice day",2)