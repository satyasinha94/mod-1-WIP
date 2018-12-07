require 'pry'

class Actor < ActiveRecord::Base
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  after_initialize :default

  def default
    gender = ["male", "female"]
    self.age ||= rand(18..100)
    self.gender ||= gender.sample
    self.name ||= Faker::Name.unique.name
  end

  def self.oldest
    all.max_by{|actor| actor.age}
  end

  def self.youngest
    all.min_by{|actor| actor.age}
  end

  def self.most_prolific_male
    males = all.select{|actor| actor.gender == 'male'}
    males.max_by{|actor| actor.movies.size}
  end

  def self.most_prolific_female
    females = all.select{|actor| actor.gender == 'female'}
    females.max_by{|actor| actor.movies.size}
  end

  def self.pickiest
    all.min_by{|actor| actor.movies.size}
  end

  def self.top_three_prolific
    all.max_by(3){|actor| actor.movies.size}
  end

  def bio
    puts "Name: #{self.name}"
    puts "Age: #{self.age}"
    puts "Gender: #{self.gender}"
  end

end
