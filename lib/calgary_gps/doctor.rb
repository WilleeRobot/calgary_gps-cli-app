class CalgaryGps::Doctor
  attr_accessor :name, :rating, :badges, :profile_url, :bio

  @@all = []

  def initialize(name, profile_url, rating)
    @name = name
    @profile_url = profile_url
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end


end
