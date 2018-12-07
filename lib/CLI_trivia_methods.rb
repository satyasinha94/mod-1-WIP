def gender #shows movies that have an equal amount of men and women actors
  if Movie.gender_balance.length == 0
    puts "No gender-equal movies in database!"
  else
    puts "Here are some movies have an equal number of male and female actors: "
    movies = Movie.gender_balance.sample(5)
    movies.each do |movie|
        puts movie.name
          movie.actors.each do |actor|
            puts "Actors: #{actor.name}"
      end
    end
  end
end

def oldest_actor
  puts "Name: #{Actor.oldest.name}"
  puts "Age: #{Actor.oldest.age}"
end

def most_prolific_male_actor #shows male actor with the most films
  actor_name = Actor.most_prolific_male.name
  movie_num = Actor.most_prolific_male.movies.size
  puts "#{Actor.most_prolific_male.name}! He's starred in #{movie_num} movies:"
  Actor.most_prolific_male.movies.each{|movie| puts movie.name}
end

def most_prolific_female_actor #shows female actor with the most films
  actor_name = Actor.most_prolific_female.name
  movie_num = Actor.most_prolific_female.movies.size
  puts "#{Actor.most_prolific_female.name}! She's starred in #{movie_num} movies:"
  Actor.most_prolific_female.movies.each{|movie| puts movie.name}
end

def biggest_cast #shows movie with biggest cast
  movie_name = Movie.most_actors.name
  cast_size = Movie.most_actors.actors.size
  puts "#{movie_name} has the biggest cast with #{cast_size} actors."
end

def class_method_runner
  input = user_input_trivia
  valid_trivia_option(input)
  if input == 1
    oldest_actor
    quit
  elsif input == 2
    most_prolific_male_actor
    quit
  elsif input == 3
    biggest_cast
    quit
  elsif input == 4
    most_prolific_female_actor
    quit
  elsif input == 5
    gender
    quit
  end
end
