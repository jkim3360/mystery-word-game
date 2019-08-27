class Word
  # Stores the provided word in an instance variable and
  # setups up any other instance variables.
  attr_accessor :displaying_word
  def initialize(word)
    @word = word
    @arr_letters = @word.split("")
    @underscores = "_"*@word.length
  end
  # Guess a letter in the word.
  # Should return a boolean. true if the letter is in the word, false if not.
  def guess?(letter)
    if(@word.include? letter)
      arr_index = []
      arr_index = @arr_letters.each_index.select do |i| 
        @arr_letters[i] == letter
      end
      arr_index.each do |index|
        @underscores[index] = letter
      end
      return true
    else
      return false
    end
  end
  # Whether all letters in the word have been guessed correctly.
  def guessed_all_correct?
    if @underscores == @word
      puts "CONGRATS"
      return true
    else
      return false
    end
  end
  # Display the current state of the guessed word for the player.
  def output_word
    puts @underscores
  end
  # Check whether a provided character is a letter
  def self.is_letter?(character)
  end
end


class MysteryWordGame
  # Initialize any state in the game, and start the game loop.
  attr_accessor :word
  def initialize
    @lives = 10
    @word
  end
  def ask_for_word
    puts "Enter a word"
    local_word = gets.chomp
    @word = Word.new(local_word)
  end
  # Run the game loop, which continues until the player wins or loses.
  def game_loop
    game_over = false
    while @lives > 0 && game_over == false do
      puts "Enter letter"
      local_letter = gets.chomp
      if @word.guess?(local_letter)
        @word.output_word
      else
        @lives -=1
        puts "You lose a life"
        if @lives == 0
          puts "YOU LOSE"
        end
      end
      game_over=@word.guessed_all_correct?
    end
  end
end 
game = MysteryWordGame.new
game.ask_for_word
game.game_loop