class Substrings
    # Takes in a string and an array of valid substrings, and returns a hash
    # listing each substring (case insensitive) from the array that was found
    # in the inputted string and how many times it was found
    def substrings(string, substr_array)
        hash = {}

        substr_array.each do |substr|
            # count string occurrences (case insensitive)
            numOccurrences = string.downcase.scan(substr).count
            if numOccurrences > 0
                hash[substr] = numOccurrences
            end
        end
        return hash
    end

end
