class CaesarCipher
    # Takes in a string, plaintext, and the shift factor, num_shift and returns 
    # a string with each letter in plaintext replaced by a letter shifted down 
    # the alphabet by num_shift positions
    def encrypt(plaintext, num_shift)
        result = ""

        # outputs an array containing characters converted to their ASCII value
        plaintext.bytes.each do |ascii|
            base = ascii <= 90 ? 65 : 97
            # shift alphabet characters
            if (ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122)
                # convert shifted ASCII value to its corresponding character
                char = ((ascii - base + num_shift) % 26 + base).chr
            # keep non-alphabet characters the same
            else
                # convert ASCII value to its corresponding character
                char = ascii.chr
            end
            result << char
        end
        return result
    end
end
