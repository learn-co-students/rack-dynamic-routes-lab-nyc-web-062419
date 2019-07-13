class Item

  @@all = []

  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    Item.all << self
  end

  def self.all
    @@all
  end

end
