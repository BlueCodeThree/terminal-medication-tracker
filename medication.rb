class Medication
    attr_reader :name, :dose, :frequency
    def initialize(name, dose, frequency)
        @name = name

        # dose is an array with the measurement as the first item (ml, tablets, grams for example), and the amount (iteger) as the second item. i.e. ["tablets", 10]
        @dose = dose

        @frequency = frequency
    end

end

class Panadol < Medication
    def initialize
        super("Panadol", ["tablets", 2], "once daily")
    end
end

class Asprin < Medication
    def initialize
        super("Asprin", ["tablets", 1], "once daily")
    end
end

class Cough_Syrip < Medication
    def initialize
        super("Cough Syrip", ["ml", 30], "once daily")
    end
end

# future enhancement - add a medicine that has a special property - such as only take with food. Create a module. 

