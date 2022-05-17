#define needed methods

def prompt(txt)
  puts "=>" + txt
end

#number checker
def numcheck(num)
  return true if num.to_f.to_s == num || num.to_i.to_s == num
end

# welcome message
prompt("Welcome to FANTASTO-CALC monthly edition")

#make sure a string is input for name
name = ''
loop do
prompt("What is your name?")
name = Kernel.gets().chomp()
  unless name == ''
    break
  end
end

# get user's loan amount and assign to a variable
prompt("Hello #{name}, how much is owed on the loan?")
# check input for valid number
amount = ''
loop do
  amount = Kernel.gets().chomp()
  # clean the number up
  amount.delete!(',')
  # verify the number
  if numcheck(amount)
    break
  else
    prompt("please input a valid number. Don't include decimals if it is an integer")
  end
end

# get user's APR on the loan
# get and check number
apr = ''
loop do
  prompt("What is the APR on the loan?")
  apr = Kernel.gets().chomp()
  if apr.to_f >= 30
    prompt("Please reflect upon your life choices, #{name}. Now...")
    next
  elsif numcheck(apr)
    break
  else
    prompt("Please input an integer or float number up to two decimal palces")
  end
end


# convert user input to float
apr = apr.to_f / 100

# convert the APR to monthly interest
mpr = apr / 12

# get user's loan duration in years and assign to a variable
months = ''
loop do
  prompt("How many months will you be paying for this amount?")
  months = Kernel.gets().chomp()
    if numcheck(months)
      break
    else
      "Please enter an integer..."
    end
end

# calculate the monthly payment
payment = amount.to_f * (mpr.to_f / (1 - (1 + mpr.to_f)**(-months.to_f)))
puts payment 

# print the result
prompt("your monthly payment, #{name}, will be #{payment}")

# ask the user if they want to calculate another monthly payment