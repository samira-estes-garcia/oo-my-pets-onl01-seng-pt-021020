class Owner
  
  attr_reader :name, :species 
  attr_accessor :cats, :dogs
  
  @@all = [ ]
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all 
    @@all.clear
  end
  
  # Instance Methods
  
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end
  
  def dogs 
   Dog.all.select{|dog| dog.owner == self}
  end
  
  def buy_cat(cat)
    Cat.new(cat, self)
  end 
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end
  
  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats 
    cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets 
    pets = dogs + cats
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end
  
  def list_pets 
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  
end