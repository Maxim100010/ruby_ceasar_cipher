require 'pry-byebug'
require 'pp'

def ceasar_cipher(string, factor, direction)
  result = ""
  alphabet = ("a".."z").to_a

  if (string == "" || factor < 1 || (direction != "left" && direction != "right"))
    puts "String is empty, factor is less than 1, or direction does not equal left or right"
    return
  end

  string.split('').each do |letter|
    upcaseFlag = (letter == letter.upcase)
    if letter == (" ") || /[[:punct:]]/.match(letter)
      result += letter
    else
      index = alphabet.find_index(letter.downcase)
      if(direction == "left")
        upcaseFlag ? result += alphabet[index - factor].upcase : result += alphabet[index - factor]
      else
        if(index + factor > alphabet.length)
        adjustedIndex = (index + factor) - alphabet.length
        upcaseFlag ? result += alphabet[adjustedIndex].upcase : result += alphabet[adjustedIndex]
        else
          upcaseFlag ? result += alphabet[index + factor].upcase : result += alphabet[index + factor]
        end
      end
    end
  end
  result
end

pp ceasar_cipher('What a string!', 5, "left")
