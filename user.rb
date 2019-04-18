require_relative 'medication'
require 'io/console'
require 'tty-prompt'

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
        choices = {}
        prompt = TTY::Prompt.new

        # Goes through all the medicine for the user, and adds the details of each to a hash that will be used to ask the user if they have taken them today. 
        @medication.each do |name, medication|
            choices["#{medication.dose[1]} #{medication.dose[0]} of #{name}"] = name
        end
        
        # This grab that array and shows the user a multiple choice of the medication
        take_medication = prompt.multi_select("Please select what you have taken today", choices)

        # Adds the medication that has been selected to the history
        take_medication.each do |medication|
            add_history(@medication[medication])
            puts "You took #{medication}"
        end
        puts
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