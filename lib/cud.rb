require 'pry'

def actor_create_or_find #lets user create an actor, or finds it if he/she's already in the database.
  puts "Enter a name, age, and gender to add an actor to the database."
  print "Name: "
  name = gets.chomp
  print "Age: "
  age = gets.chomp
  print "Gender: "
  gender = gets.chomp
  if find_actor(NameCase(name))
    puts "Sorry, that person's already in the database!"
    run
  else
    new_actor = Actor.create(name: name, age: age, gender: gender)
    puts "Congrats! #{Actor.all.last.name} has been added to the database."
    new_actor
  end
end

def movie_create_or_find #lets user create a movie, or finds it if it's already in the database.
  puts "Enter a name, genre, and year of release to add a movie to the database."
  print "Name: "
  name = gets.chomp
  print "Genre: "
  genre = gets.chomp
  print "Release Year: "
  release_date = gets.chomp
  if find_movie(NameCase(name))
    puts "Sorry, that movie's already in the database!"
    run
  else
    new_movie = Movie.create(name: name, genre: genre, release_year: release_date)
    puts "Congrats! #{Movie.all.last.name} has been added to the database."
    new_movie
  end
end

def update_cast #lets a user add actors to a movie's cast, but not if they're already on the cast.
  puts "Enter an actor to add to a movies cast."
  print "Actor: "
  actor_input = gets.chomp
  valid_actor(actor_input)
  actor = find_actor(actor_input)
  puts "Match found! What movie's cast do you want to add this actor to?"
  print "Movie: "
  movie_input = gets.chomp
  valid_movie(movie_input)
  movie = find_movie(movie_input)
  if movie.actors.include?(actor)
    puts "Sorry! He's already on the cast!"
    run
  else
    movie.actors.push(actor)
    puts "Congrats! #{actor.name} has been added to #{movie.name}'s cast.'"
  end
end

def update_filmography #adds a movie to an actor's filmography, but not if it's already in there.
  puts "Enter a movie to add to an actors filmography."
  print "Movie: "
  movie_input = gets.chomp
  valid_movie(movie_input)
  movie = find_movie(movie_input)
  puts "Match found! What actor's filmography do you want to add this movie to?"
  print "Actor: "
  actor_input = gets.chomp
  valid_actor(actor_input)
  actor = find_actor(actor_input)
  if actor.movies.include?(movie)
    puts "Sorry! That's already in his filmography!"
    run
  end
    actor.movies.push(movie)
    puts "Congrats! #{movie.name} has been added to #{actor.name}'s filmography.'"
end

def create_movie_and_cast #lets a user create a new movie and a new cast of actors
  movie_create_or_find
  puts "how many new actors do you want to add to this movie's cast?"
  new_actors = gets.chomp.to_i
  puts "What's the total size of the cast?"
  cast = gets.chomp.to_i
  new_actors.times do
    actor_create_or_find
  end
  cast.times do
    update_cast
  end
end

def delete
  puts "Actor or movie?"
  input = gets.chomp.downcase
  if input == 'actor'
    puts "Who do you want to delete?"
    actor_input = gets.chomp
    actor = find_actor(actor_input)
    if actor == nil
      puts "Not in database!"
      run
    else
      puts "#{actor.name} has been deleted."
      Actor.delete(actor)
    end
  elsif input == 'movie'
    puts "What movie do you want to delete?"
    movie_input = gets.chomp
    movie = find_movie(movie_input)
    if movie == nil
      puts "Not in database!"
      run
    else
      puts "#{movie.name} has been deleted."
      Movie.delete(movie)
    end
  elsif input != 'actor' || input != 'movie'
      puts "invalid command"
      cud_runner
  end
end

def cud_runner
  input = cud_input
  valid_cud(input)
  case input
    when 1
      actor_create_or_find
      quit
    when 2
      movie_create_or_find
      quit
    when 3
      update_cast
      quit
    when 4
      update_filmography
      quit
    when 5
      create_movie_and_cast
      quit
    when 6
      delete
      quit
    end
end
