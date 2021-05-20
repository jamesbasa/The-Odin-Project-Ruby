# Returns a string with each letter in plaintext replaced by a letter
# some fixed number of positions down the alphabet
def caesar_cipher(plaintext, num_shift)
    result = ""

    # outputs an array containing characters converted to their ASCII value
    plaintext.bytes.each do |ascii|
        # shift alphabet characters
        if (ascii >= 65 && ascii <= 90)
            # convert shifted ASCII value to its corresponding character
            char = ((ascii - 65 + num_shift) % 26 + 65).chr
        elsif (ascii >= 97 && ascii <= 122)
            char = ((ascii - 97 + num_shift) % 26 + 97).chr
        # keep non-alphabet characters the same
        else
            # convert ASCII value to its corresponding character
            char = ascii.chr
        end
        result << char
    end
    return result
end

input = "What a string!"
output = caesar_cipher(input, 5)
puts "#{input} => #{output}"
puts "Correct?: #{"Bmfy f xywnsl!" == output}\n\n"

input = "Caesar Cipher"
output = caesar_cipher(input, 24)
puts "#{input} => #{output}"
puts "Correct?: #{"Aycqyp Agnfcp" == output}\n\n"

# Edge case: negative shift and non-alphabet characters
input = "abC `!@#$/}"
output = caesar_cipher(input, -30)
puts "#{input} => #{output}"
input2 = "abC `!@#$/}"
output2 = caesar_cipher(input2, -4)
puts "#{input2} => #{output2}"
puts "Correct?: #{output == output2}\n\n"
