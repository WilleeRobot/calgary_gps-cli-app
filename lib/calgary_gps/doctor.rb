class CalgaryGps::Doctors
  attr_accessor :name, :rating, :badges, :profile_url, :bio

  @@all = []

  def initialize(name, profile_url)
    @name = name
    @profile_url = profile_url
    @@all << self
  end

  def self.all
    @@all
  end


end