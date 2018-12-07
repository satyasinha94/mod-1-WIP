require 'pry'
class Movie < ActiveRecord::Base
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  after_initialize :default

  def default
    genres = ["Action", "Drama", "Mystery", "Comedy", "Thriller"]
    self.release_year ||= rand(1888..2018)
    if self.genre.class != String
     self.genre = genres.sample
   end
    self.name ||= Faker::Hipster.unique.sentence(1)
  end

  def self.most_actors
    all.max_by{|movie| movie.actors.size}
  end

  def self.oldest
    all.min_by{|movie| movie.release_year}
  end

  def self.newest
    all.max_by{|movie| movie.release_year}
  end

  def man_count
    self.actors.select{|actor| actor.gender == 'male'}.length
  end

  def woman_count
    self.actors.select{|actor| actor.gender == 'female'}.length
  end

  def self.gender_balance
    all.select{|movie| movie.man_count - movie.woman_count == 0 && movie.actors != [0..1]}
  end

  def self.genre_by_frequency
    genres = all.map{|movie| movie.genre}
    genre_hash = genres.each_with_object(Hash.new(0)){|key,hash| hash[key] += 1}
    genre_hash
  end

  def self.most_common_genre
    genre_by_frequency.max_by{|key,value| value}
  end
end
