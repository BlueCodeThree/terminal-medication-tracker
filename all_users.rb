require_relative 'user'
require_relative 'medication'

users = [
    ["marge", marge = User.new("Marge").add_medication(Panadol.new).add_medication(Asprin.new).add_medication(Cough_Syrip.new), 1234],
    ["john", john = User.new("John").add_medication(Panadol.new).add_medication(Cough_Syrip), 4323],
    ["sally", sally = User.new("Sally").add_medication(Asprin.new).add_medication(Cough_Syrip), 3333]
]

puts "enter your name"
name = gets.chomp.downcase
for user in users
    if name == user[0]
        person = user[1]
        puts "Hello #{person.name}"

        puts "pin?"
        guess = gets.chomp.to_i
        if guess == user[2]
            puts "yes pin!"
        end
    end
end

person.print_schedule