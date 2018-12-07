# # Male Actors
brad = Actor.create(name: "Brad Pitt", age: 54, gender: "male")
al = Actor.create(name: "Al Pacino", age: 78, gender: "male")
deniro = Actor.create(name: "Robert De Niro", age: 75, gender: "male")
dicaprio = Actor.create(name: "Leonardo Di Caprio", age: 44, gender: "male")
daylewis = Actor.create(name: "Daniel Day-Lewis", age: 61, gender: "male")
#
# # Female Actors
emma = Actor.create(name: "Emma Stone", age: 30, gender: "female")
helen = Actor.create(name: "Helen Mirren", age: 73, gender: "female")
rachel = Actor.create(name: "Rachel McAdams", age: 40, gender: "female")
meryl = Actor.create(name: "Meryl Streep", age: 69, gender: "female")
amy = Actor.create(name: "Amy Adams", age: 44, gender: "female")
helena = Actor.create(name: "Helena Bonham Carter", age: 52, gender: "female")
sharon = Actor.create(name: "Sharon Stone", age: 60, gender: "female")
#
# # Movies
fury = Movie.create(name: "Fury", genre: "Action", release_year: 2014)
fight_club = Movie.create(name: "Fight Club", genre: "Drama", release_year: 1999)
moneyball = Movie.create(name: "Moneyball", genre: "Drama", release_year: 2011)
godfather = Movie.create(name: "The Godfather", genre: "Drama", release_year: 1972)
godfather2 = Movie.create(name: "The Godfather Part II", genre: "Drama", release_year: 1974)
heat = Movie.create(name: "Heat", genre: "Action", release_year: 1995)
blood = Movie.create(name: "There Will Be Blood", genre: "Drama", release_year: 2007)
revenant = Movie.create(name: "The Revenant", genre: "Thriller", release_year: 2016)
casino = Movie.create(name: "Casino", genre: "Drama", release_year: 1995)
oceans2 = Movie.create(name: "Oceans 8", genre: "Thriller", release_year: 2018)
#
# # MovieActors
brad.movies.push(fury, fight_club, moneyball)
al.movies.push(godfather, heat, godfather2)
deniro.movies.push(casino, heat)
dicaprio.movies.push(revenant)
daylewis.movies.push(blood)
#
# #add women to movies
fight_club.actors.push(helena)
casino.actors.push(sharon)
heat.actors.push(amy, rachel, meryl)
moneyball.actors.push(meryl)
oceans2.actors.push(emma, helen, rachel, meryl, amy, helena, sharon)

#Random actors
2000.times do
  Actor.create
end
#
400.times do
  Movie.create
end

1000.times do
  MovieActor.create(movie_id: rand(Movie.first.id..Movie.last.id), actor_id: rand(Actor.first.id..Actor.last.id))
end
