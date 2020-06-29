class Owner
  attr_reader :name, :species
  @@all = []
  # Instance Methods
  def initialize(name)
    @name = name
    @@all << self
  end
  def species
    @species = "human"
  end
  def say_species
    "I am a human."
  end
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  def buy_cat(name)
   cat = Cat.new(name, self)
   cat.owner = self
  end
  def buy_dog(name)
   dog = Dog.new(name, self)
   dog.owner = self
  end
  def walk_dogs
    Dog.all.map do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    Cat.all.map do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    Cat.all.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    Dog.all.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  # Class Methods
  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end
end