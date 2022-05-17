
#METHODS AND ARRAYS

VALID_CHOICES = %w[rock paper scissors lizard spock]
=begin
WINNING_MOVES = {
  rock: ['scissors','lizard']
  paper: ['rock', 'lizard']
  scissors: ['lizard', 'paper']
  lizard: ['spock', 'paper']
  spock: ['rock', 'scissors']
}
=end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'spock' && second == 'rock') ||
  (first == 'spock' && second == 'scissors')
end

def display_score(player, computer)
  puts "player: #{player}"
  puts "computer: #{computer}"
end

def display_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "You lost!"
  else
    "It's a tie!"
  end
end

def prompt(message)
  Kernel.puts("=>" + message)
end

def return_converted_choice(input)
  if input == 'r'
    'rock'
  elsif input == 'p'
    'paper'
  elsif input == 'sc'
    'scissors'
  elsif input == 'sp'
    'spock'
  elsif input == 'l'
    'lizard'
  end
end

#GAME CODE

loop do # game loop
  round_counter = 1
  choice = ''
  player_score = 0
  computer_score = 0
  game_result = ''

  welcome_message = <<~MSG
  \n ROCK PAPER SCISSORS LIZARD SPOCK!
  a game of chance and split second subjective thinking
  =====================================================
  "Scissors cuts paper, paper covers rock, rock crushes lizard, 
  lizard poisons Spock, Spock smashes scissors, 
  scissors decapitates lizard, lizard eats paper, 
  paper disproves Spock, Spock vaporizes rock, 
  and as it always has, rock crushes scissors."
  ~Sheldon Cooper
  =====================================================
  MSG
 
  prompt(welcome_message)

  loop do # round loop
    loop do
      puts "***********ROUND #{round_counter}***********"
      display_score(player_score, computer_score)
      prompt("Choose one: #{VALID_CHOICES.join(',')} \n => you may use (r)
      for rock, (p) for paper, (sc) for scissors, (sp) for spock), (l)
        for lizard")
      choice = Kernel.gets().chomp()

      unless choice.size > 2
        choice = return_converted_choice(choice)
      end

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    game_result = display_result(choice, computer_choice)

    puts game_result

    if game_result == 'You won!'
      player_score += 1
    elsif game_result == 'You lost!'
      computer_score += 1
    end

    round_counter += 1

    break if player_score == 3 || computer_score == 3
  end

  prompt("Final score<=")
  display_score(player_score, computer_score)

  prompt("Do you want to play again?")

  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
