class CalgaryGps::Doctor
  attr_accessor :name, :rating, :badges, :profile_url, :bio, :specialty

  @@all = []

  # def initialize(name, profile_url, rating)
  #   @name = name
  #   @profile_url = profile_url
  #   @rating = rating
  #   @@all << self
  # end

  #initialize every doctor by forcing it to create only through hashes (metaprammed)

  def initialize(doctor_hash)
    doctor_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  #CLASS METHODS

  def self.create_from_collection(doctor_array)
    #EXAMPLE OF ARRAY OUTPUT
    doctor_array.each do |hash|
      CalgaryGps::Doctor.new(hash)
    end
  end

  def self.all
    @@all
  end

  

end
