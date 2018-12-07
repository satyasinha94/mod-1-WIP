def random
  choices = ["actor", "movie"]
  choice = choices.sample
  if choice == 'actor'
    actors = Actor.all.select{|actor| actor.movies.length != 0}
    actor = actors.sample.name
    option = actor_info_options(actor)
    valid_option = valid_actor_options(option)
    if valid_option == 1 #gets list of movies actor's been in
      actor = find_actor(actor)
      movies = find_movies(actor)
      show_movie_info(movies)
      quit
    elsif valid_option == 2 #biographical info about actor
      actor = find_actor(actor)
      actor_bio(actor)
      quit
    end
  elsif choice == 'movie'
    movies = Movie.all.select{|movie| movie.actors.length != 0}
    movie = movies.sample.name
    option = movie_info_options(movie)
    valid_option = valid_movie_options(option)
    if valid_option == 1 #gets list of actors in this movie
      movie = find_movie(movie)
      actors = find_actors(movie)
      show_actor_info(actors)
      quit
    elsif valid_option == 2 #gets list of other movies w/ same genre
      movie = find_movie(movie)
      similar_genre(movie)
      quit
    end
  end
end
