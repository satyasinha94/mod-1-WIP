def find_actor(input) #looks for actor based on user input
     Actor.find_by(name: input)
end

def actor_bio(actor) #puts basic biographical info about actor to console
  actor.bio
end

def find_movies(actor) #finds movies that actor has been in.
  actor.movies
end

def show_movie_info(movies) #puts movie information to console
  movies.each_with_index do |movie, index|
    puts "Movie #{index + 1}"
    puts '˜˜˜˜˜˜˜˜'
    puts "Name: #{movie.name}"
    puts "Genre: #{movie.genre}"
    puts "Release Year: #{movie.release_year}"
    puts ""
  end
end

def valid_actor(input) #check if actor is in database. If not, return to start and ask again.
  if Actor.find_by(name: input).nil?
    puts "Can't find name in database, try again. Please note that names are case sensitive."
    actor_instance_runner
  end
end

def actor_instance_runner #actor methods
  input = user_input_actor
  valid_actor(input)
  option = actor_info_options(input)
  valid_option = valid_actor_options(option)
  if valid_option == 1 #gets list of movies actor's been in
    actor = find_actor(input)
    movies = find_movies(actor)
    show_movie_info(movies)
    quit
  elsif valid_option == 2 #biographical info about actor
    actor = find_actor(input)
    actor_bio(actor)
    quit
  end
end
