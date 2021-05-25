require_relative 'hangman'  

hangman = Hangman.new
# let the user load a game if desired
loaded_game = hangman.load_game()
is_saved = hangman.start_game()
if is_saved
    hangman.save_game(hangman)
end
