require 'pry'
require 'artii'



class CommandLineInterface

  def greet
    a = Artii::Base.new
    puts a.asciify('CLI-Movie-DB')
    puts "Welcome to CLI-Movie-DB! What do you want to do?"
    puts ""
  end

  def start_options
    puts "1. Actor-specific info."
    puts ""
    puts "2. Movie-specific info"
    puts ""
    puts "3. General film trivia"
    puts ""
    puts "4. Update the database."
    puts ""
    puts "5. Select a random actor/movie."
    input = gets.chomp.to_i
  end

  def cud_input
    puts "1. Add an actor to the database."
    puts ""
    puts "2. Add a movie."
    puts ""
    puts "3. Add an actor to a movie's cast."
    puts ""
    puts "4. Add a movie to an actor's filmography."
    puts ""
    puts "5. Add a movie/cast together."
    puts ""
    puts "6. to delete an entry."
    input = gets.chomp.to_i
  end

  def user_input_actor
    print "Actor: "
    input = gets.chomp
  end

  def user_input_movie
    print "Movie: "
    input = gets.chomp
  end

  def user_input_trivia
    puts "1. Find the oldest actor."
    puts ""
    puts "2. Find the most prolific male actor."
    puts ""
    puts "3. Find the movie with the biggest cast."
    puts ""
    puts "4. Find the most prolific female actor."
    puts ""
    puts "5. Find movies with the most balanced gender representation."
    input = gets.chomp.to_i
  end

  def movie_info_options(input)
    puts "What do you want to know about #{input}?"
    puts ""
    puts "1. Cast list."
    puts ""
    puts "2. Other movies of the same genre."
    puts ""
    new_input = gets.chomp.to_i
  end

  def actor_info_options(input)
    puts "What do you want to know about #{input}?"
    puts ""
    puts "1. List of his/her movies."
    puts ""
    puts "2. His/her bio."
    puts ""
    new_input = gets.chomp.to_i
  end

  def quit #asks user to quit or continue. Prompts again if user doesn't quit/continue
    print "To continue using the database type 'continue', or type 'quit' to quit: "
    input = gets.chomp.downcase
    if input == 'continue'
      run
    elsif input == 'quit'
      exit
    elsif input != 'continue' || input != 'quit'
      puts "Invalid command! Please enter 'continue' or 'quit'."
      quit
    end
  end

  def run
    greet
    initial_input = start_options
    valid(initial_input)
    case initial_input
      when 1
        actor_instance_runner
      when 2
        movie_instance_runner
      when 3
        class_method_runner
      when 4
        cud_runner
      when 5
        random
    end
  end
end
