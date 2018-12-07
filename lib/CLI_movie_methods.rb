def find_movie(input) #finds movie based on user input
     Movie.find_by(name: input)
end

def find_actors(movie) # cast of the movie
  movie.actors
end

def show_actor_info(movies) #shows cast of movie to user
  puts "Total actors: #{movies.size}"
  movies.each do |actor|
    puts actor.name
  end
end

def similar_genre(movie_name) #finds movies of the same genre
  similar_movies = Movie.all.select{|movie| movie.genre == movie_name.genre}
  similar_movies.delete_if{|movie| movie == movie_name}
  puts "Here are some movie suggestions with the same genre."
  similar_movies.sample(5).each do |movie|
    puts movie.name
    puts ''
  end
end


  def movie_instance_runner #movie methods
    input = user_input_movie
    valid_movie(input)
    option = movie_info_options(input)
    valid_option = valid_movie_options(option)
    if valid_option == 1 #gets list of actors in this movie
      movie = find_movie(input)
      actors = find_actors(movie)
      show_actor_info(actors)
      quit
    elsif valid_option == 2 #gets list of other movies w/ same genre
      movie = find_movie(input)
      similar_genre(movie)
      quit
    end
  end
