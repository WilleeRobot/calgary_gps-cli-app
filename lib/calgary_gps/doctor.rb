require 'pry'

class CalgaryGps::Doctor
  attr_accessor :name, :rating, :profile_url, :biography, :specialty, :accepting_patients

  @@all = []

  #initialize every doctor by forcing it to create only through hashes (metaprammed)

  def initialize(doctor_hash)

    doctor_hash.each do |key, value|
      if key == :specialty
        #specialty is its own object. Doctor has specialty; specialty has many doctors

        if CalgaryGps::Specialty.all.none? {|specialty| specialty.name == value}
          self.send("#{key}=", CalgaryGps::Specialty.new(value))
        else

          self.send("#{key}=", CalgaryGps::Specialty.all.detect{|specialty| specialty.name == value})
        end
        self.specialty.doctors << self
      else
        self.send("#{key}=", value)
      end
    end

    @@all << self
  end

  #CLASS METHODS

  def self.create_from_collection(doctor_array)
      doctor_array.each do |hash|
      CalgaryGps::Doctor.new(hash)
    end
  end

  def self.all
    @@all
  end

end
