require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=>#{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def integer?(input)
  input.to_i.to_s == input
end

num1 = nil
num2 = nil

# Greeting
prompt(messages('welcome'))
# Find out which operation the user wants to perform

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name'))
  else
    break
  end
end

loop do # main loop
  prompt(" Hello #{name} What kind of operation do you want to do?")
  options = <<-MSG
    1) add
      2) subtract
      3) multiply
      4) divide
  MSG

  prompt(options)
  operation = ''
  loop do
    operation = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("Error, please enter 1, 2, 3 or 4")
    end
  end

  # get the numbers
  loop do
    prompt("What is the first number?")
    num1 = gets().chomp()
    if integer?(num1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end
  loop do
    prompt("What is the second number?")
    num2 = gets().chomp()
    if integer?(num2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  def operation_to_message(op)
    case op
    when '1'
      prompt('adding...')
    when '2'
      prompt('subtracting...')
    when '3'
      prompt('multiplying...')
    when '4'
      prompt('dividing...')
    end
  end

  operation_to_message(operation)

=begin
#do the math
sum = if operation == '1'
  num_1.to_i + num_2.to_i
  elsif operation == '2'
  num_1.to_i - num_2.to_i
  elsif operation == '3'
  num_1.to_i * num_2.to_i
  elsif operation == '4'
  num_1.to_f / num_2.to_f
  else
  prompt("Error, please input a number from the operations list")
  next
end
=end

  sum = case operation
        when '1'
          num1.to_i + num2.to_i
        when '2'
          num1.to_i - num2.to_i
        when '3'
          num1.to_i * num2.to_i
        when '4'
          num1.to_f / num2.to_f
        else
          prompt("Error, please input a number from the operations list")
          next
        end

  # print the output
  prompt("Your result is:")
  prompt(sum)
  break
end
