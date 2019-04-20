# require 'io/console'
require 'tty-prompt'
require_relative 'classes/user'
require_relative 'classes/medication'

#Initialize the user and their medicine
marge = User.new("Marge")
marge.add_medication(Panadol.new).add_medication(Asprin.new).add_medication(Cough_Syrup.new)

def check_pin(user)
    # check that the user has credentials to access the programm
    clear
    puts "Hello #{user.name}"
    user.enter_pin
end

def main_menu(user)
    currently_using = true

    while currently_using
        selection = TTY::Prompt.new.select("Please select from the following", ["Take Medication", "Your Medication",  "History", "Exit"], cycle: true, marker: '>', echo: false)

        case selection
        when 'History'
            user.print_history
        when 'Your Medication'
            user.print_medication
        when 'Take Medication'
            user.take_medication
        when "Exit"
            clear
            puts "Have a lovely day, #{user.name}"
            currently_using = false
        else
            puts "Ooops, something went wrong"
        end
    end
end

check_pin(marge)
main_menu(marge)
