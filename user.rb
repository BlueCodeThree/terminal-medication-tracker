require_relative 'medication'
require 'io/console'

class User
    attr_reader :name

    def initialize(name)
        @name = name
        @pin = "1234"

        # medication is a hash with key: medicine's name, and value: medication's object
        @medication = {}

        # history is an array of hashes. Each array will have the time, name of medication, and the dose
        @history = []
    end

    def enter_pin
        pin_guess = TTY::Prompt.new
        pin_guess.mask("Please enter your pin:") do |check|
            check.validate(->(a){a == @pin}, 'Confirmation must match password')
        end
        clear
    end

    def add_medication(medicine)
        @medication[medicine.name] = medicine
        return self
    end

    # this will loop through the medication and provide a schedule for the user
    def print_schedule
        clear
        puts "-- MEDICATION SCHEDULE --".center(30)
        @medication.each do |name, details| 
            puts "#{name}: #{details.dose[1]} #{details.dose[0]} #{details.frequency}"
        end
        puts
    end

    # user adding in the medication they have taken to the app
    def take_medication
        clear
        @medication.each do |name, medication|
            check_medication_input(name, medication)
        end
    end

    def check_medication_input(name, medication)
        puts "#{@name}, did you take #{medication.dose[1]} #{medication.dose[0]} of #{name}? (Y / N)"
        case $stdin.getch.downcase
        when "y"
            #add it to the history array
            add_history(@medication[name])
            puts "You took #{name}!\n\n"

        when "n"
            puts "You didn't take #{name}\n\n"

        else
            puts "Oops, something went wrong\n\n"
            check_medication_input(name, medication)
        end
    end

    def add_history(medication)
        @history.push({time: Time.now, medication: medication.name, dose: medication.dose})
    end

    # this will print out the history of what they took for the user
    def print_history
        clear
        if @history.length == 0
            puts "You haven't taken any medicine yet"
        else
            puts " -- YOUR MEDICATION HISTORY --"
            @history.each do |record|
                puts "#{record[:time]}: #{record[:dose][1]} #{record[:dose][0]} of #{record[:medication]}"
            end
        end
        puts
    end
end

# handy clear function
def clear
    puts "\e[2J\e[f"
end