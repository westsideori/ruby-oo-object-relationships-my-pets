class Owner
attr_reader :name, :species
  @@all = []

  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.find_all {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.find_all { |dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats 
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = []
    self.dogs.each do |dog|
      pets << dog
    end
    self.cats.each do |cat|
      pets << cat
    end
    pets.each do |pet| #itterate over new array pets and return nil for owners and nervous for pets mood
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end