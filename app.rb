require 'io/console'
require 'tty-prompt'
require_relative 'user.rb'
require_relative 'medication.rb'

#Initialize the user and the medicine
marge = User.new("Marge").add_medication(Panadol.new).add_medication(Asprin.new).add_medication(Cough_Syrip.new)

# Initializing the menu
menu = TTY::Prompt.new

clear
puts "Hello #{marge.name}"
marge.enter_pin

loop do
    selection = menu.select("Please select from the following", ["Take Medication", "Schedule",  "History", "Exit"], cycle: true, marker: '>')

    # puts "Please select the menu number from the following:"
    # puts "1. History"
    # puts "2. Schedule"
    # puts "3. Record Your Medication That You've Taken" # make this sound nicer and put it first. 
    # puts "4. Exit the program"
    # puts

    case selection
    when 'History'
        marge.print_history
    when 'Schedule'
        marge.print_schedule
    when 'Take Medication'
        marge.take_medication
    when "Exit"
        clear
        abort("Have a lovely day, #{marge.name}")
    else
        puts "Ooops, something went wrong"
    end
end
