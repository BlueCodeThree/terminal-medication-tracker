require 'io/console'
require 'tty-prompt'
require_relative 'user.rb'
require_relative 'medication.rb'

#Initialize the user and the medicine
marge = User.new("Marge")
marge.add_medication(Panadol.new).add_medication(Asprin.new).add_medication(Cough_Syrup.new)

# Initializing the menu
menu = TTY::Prompt.new

clear
puts "Hello #{marge.name}"
marge.enter_pin

currently_using = true

while currently_using
    selection = menu.select("Please select from the following", ["Take Medication", "Schedule",  "History", "Exit"], cycle: true, marker: '>')

    case selection
    when 'History'
        marge.print_history
    when 'Schedule'
        marge.print_schedule
    when 'Take Medication'
        marge.take_medication
    when "Exit"
        clear
        puts "Have a lovely day, #{marge.name}"
        currently_using = false
    else
        puts "Ooops, something went wrong"
    end
end
