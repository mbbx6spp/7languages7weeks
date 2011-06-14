#!/usr/bin/env ruby

def guesser
  def init
    # Must avoid answer being 0 otherwise "k".to_i => 0 would work!
    answer = rand(9) + 1
    puts answer
    ask
    guess = until_within_range(gets.to_i)
    puts guess
    counter = 1
    [guess, answer, counter]
  end

  def range?(user_guess)
    (0 < user_guess) && (user_guess <= 10)
  end

  def correct?(user_guess, actual_answer)
    (user_guess === actual_answer)
  end

  def ask
    puts "What number (1-10) would you like to guess?"
  end

  def out_of_range
    $stderr.puts "ERROR: Guess out of range (1-10). Try again: "
  end

  # Yeah, recursion is not a great idea in languages like Ruby, but...
  # since the recursion depth here is not expected to be high it should be fine
  def until_within_range(guess)
    if not range?(guess)
      out_of_range
      until_within_range(gets.to_i)
    else
      return guess
    end
  end

  # Initial setup and question/answer
  (guess, answer, counter) = init
  puts guess, answer, counter

  # subsequent guesses/checks
  while (not correct?(guess, answer))
    ask
    guess = until_within_range(gets.to_i)
    counter += 1
  end

  # Must be correct or something went wrong!?:)
  puts "Correct! Wooohooo! You guessed in #{counter} tries."
end

guesser
