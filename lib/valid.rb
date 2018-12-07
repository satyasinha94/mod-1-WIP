def valid(initial_input)
  if initial_input.between?(1,5)
    initial_input
  else
    puts "Invalid input!"
    run
  end
end

def valid_cud(option)
  if option.between?(1,6)
    option
  else
    puts "Invalid command!"
    cud_runner
  end
end

def valid_trivia_option(option)
  if option.between?(1,5)
    option
  else
    puts "Invalid entry"
    class_method_runner
  end
end

def valid_actor_options(input)
  if input.between?(1,2)
    input
  else
    puts "Invalid option"
    actor_instance_runner
  end
end

def valid_movie(input) #check if movie is in database. If not, return to start and ask again.
  if Movie.find_by(name: input).nil?
    puts "Can't find name in database, try again. Please note that names are case sensitive."
    movie_instance_runner
  end
end

def valid_movie_options(input)
  if input.between?(1,2)
    input
  else
    puts "Invalid option"
    movie_instance_runner
  end
end
