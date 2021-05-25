require 'yaml'

class Hangman
    attr_accessor :num_incorrect, :max_incorrect, :word, :is_guessed_array
    def initialize()
        @num_incorrect = 0
        @max_incorrect = 6
        @word = selectSecretWord()
        # array of booleans representing whether each char is guessed
        @is_guessed_array = Array.new(@word.length, false)
        @@sleep_time = 0.5
    end

    def selectSecretWord()
        dictionary = Array.new
        file_name = "5desk.txt"
        file_path = File.join(File.dirname(File.absolute_path(__FILE__)), file_name)
        # load in the dictionary and randomly select a word between 5 and 
        # 12 characters long for the secret word
        File.foreach(file_path) do |word| 
            dictionary.push(word.strip) if word.strip.length >= 5 && word.strip.length <= 12
        end
        word_index = rand(dictionary.length)
        return dictionary[word_index]
    end

    # Randomly selects a word, which the user must try to guess by
    # suggesting letters within the given number of guesses.
    # Returns true if the user chooses to save the game
    # Note: this does not check if your guess is a repeat of a previous one
    def start_game()
        playing = true

        puts "\nWelcome to Hangman!"
        sleep(@@sleep_time)
        puts "Enter \"save\" at any time to save your game\n\n"
        sleep(@@sleep_time)
        while playing
            sleep(@@sleep_time)
            # display which correct letters have already been chosen and 
            # which incorrect letters have already been chosen
            @word.split('').each_with_index { |char, i|
                if @is_guessed_array[i]
                    print "#{char} "
                else
                    print "_ "
                end
            }

            puts "\nNumber of guesses remaining: #{@max_incorrect - @num_incorrect}"
            print "\nGuess a character (or save your game): "
            guess = gets.chomp
            if guess.downcase == "save"
                # serialize the Hangman object
                sleep(@@sleep_time)
                puts "Your game was saved in saved_game.yaml"
                return true
            end
            # get index of first occurrence of the guessed character in the correct word
            guess_index = @word.downcase.index(guess)
            # get indices of all occurrences of the guessed character in the correct word
            indices = (0...@word.length).find_all { |i| @word.downcase[i] == guess.downcase }

            if guess_index != nil && @is_guessed_array[guess_index] == false
                # guess is correct
                puts "Correct!"
                indices.each { |index| @is_guessed_array[index] = true }
            else
                # guess is incorrect
                puts "Incorrect!"
                @num_incorrect += 1
            end

            puts
            if !@is_guessed_array.include?(false)
                sleep(@@sleep_time)
                puts "You win!"
                puts "The word was #{@word}"
                playing = false
            elsif @num_incorrect == @max_incorrect
                sleep(@@sleep_time)
                puts "You lose!"
                puts "The word was #{@word}"
                playing = false
            end
        end
        return false
    end

    def load_game()
        saved_file_name = "saved_game.yaml"
        saved_file_path = File.join(Dir.pwd, saved_file_name)
        saved_game_exists = File.file?(saved_file_path)
        # When the program first loads, give an option to open a saved game
        if saved_game_exists
            print "A previously saved game was found. Would you like to load it? (yes/no): "
            load_game = gets.chomp
            if load_game.downcase == "yes" || load_game.downcase == "y"
                # load the saved game
                puts "You entered yes...loading game..."
                sleep(@@sleep_time)
                saved_file = File.open(saved_file_path, 'r')
                loaded_yaml = YAML.load(saved_file)
                saved_file.close
                handleDeserialize(loaded_yaml)
            end
        end
    end

    def handleDeserialize(loaded_yaml)
        @num_incorrect = loaded_yaml.num_incorrect
        @max_incorrect = loaded_yaml.max_incorrect
        @word = loaded_yaml.word
        @is_guessed_array = loaded_yaml.is_guessed_array
    end

    def save_game(game)
        saved_file_name = "saved_game.yaml"
        saved_file_path = File.join(Dir.pwd, saved_file_name)
        dump = YAML.dump(game)
        File.open(saved_file_path, 'w') { |file| file.write dump }
    end
end
