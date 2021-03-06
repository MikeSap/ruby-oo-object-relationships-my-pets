require 'pry'
class Owner
    
    attr_reader :name, :species
    
    @@all = []
    
    
    def initialize(name)
        @@all.push(self)
        @name = name
        @species = "human"
    end    

    
    def say_species
        "I am a #{@species}."
    end

    def self.all
        @@all
    end

    def self.count
        self.all.count
    end

    def self.reset_all
        self.all.clear
    end

    def cats
        Cat.all.select {|cats| cats.owner == self}
    end

    def dogs
        Dog.all.select{|dogs| dogs.owner == self}
    end

    def buy_cat(pet)
        Cat.new(pet,self)
    end

    def buy_dog(pet)
        Dog.new(pet,self)
    end

    def walk_dogs
        self.dogs.each {|dog| dog.mood = "happy"}
    end

    def feed_cats
        self.cats.each {|cat| cat.mood = "happy"}
    end

    def sell_pets
        #protest
    end

    def list_pets
        "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

end