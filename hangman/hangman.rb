class Hangman
    # Randomly selects a word, which the user must try to guess by
    # suggesting letters within the given number of guesses
    # Note: this does not check if your guess is a repeat of a previous one
    def hangman()
        file_name = "5desk.txt"
        playing = true
        num_incorrect = 0
        max_incorrect = 6
        sleep_time = 0.5
        dictionary = Array.new

        # load in the dictionary and randomly select a word between 5 and 
        # 12 characters long for the secret word
        File.foreach(file_name) do |word| 
            dictionary.push(word.strip) if word.strip.length >= 5 && word.strip.length <= 12
        end
        word_index = rand(dictionary.length)
        word = dictionary[word_index]
        # array of booleans representing whether each char is guessed
        is_guessed_array = Array.new(word.length, false)

        puts "Welcome to Hangman!"
        while playing
            sleep(sleep_time)
            # display which correct letters have already been chosen and 
            # which incorrect letters have already been chosen
            word.split('').each_with_index { |char, i|
                if is_guessed_array[i]
                    print "#{char} "
                else
                    print "_ "
                end
            }

            puts "\nNumber of guesses remaining: #{max_incorrect - num_incorrect}"
            print "\nGuess a character: "
            guess = gets.strip
            # get index of first occurrence of the guessed character in the correct word
            guess_index = word.downcase.index(guess)
            # get indices of all occurrences of the guessed character in the correct word
            indices = (0...word.length).find_all { |i| word.downcase[i] == guess.downcase }

            if guess_index != nil && is_guessed_array[guess_index] == false
                # guess is correct
                puts "Correct!"
                indices.each { |index| is_guessed_array[index] = true }
            else
                # guess is incorrect
                puts "Incorrect!"
                num_incorrect += 1
            end

            puts
            if !is_guessed_array.include?(false)
                sleep(sleep_time)
                puts "You win!"
                puts "The word was #{word}"
                playing = false
            elsif num_incorrect == max_incorrect
                sleep(sleep_time)
                puts "You lose!"
                puts "The word was #{word}"
                playing = false
            end
        end
    end
end

# run the game
hangman = Hangman.new
hangman.hangman()
