class CalgaryGps::Specialty
  attr_accessor :doctors, :name

  @@all = []

  def initialize(name)
    @name = name
    #to track all doctors in specialty
    @doctors = []
    @@all << self
  end

  def self.all
    @@all
  end

  def doctors
    @doctors
  end

end
