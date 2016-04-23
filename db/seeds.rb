# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Category.create(category_name: "Action")
# Category.create(category_name: "Drama")
# Category.create(category_name: "Fiction")
# Category.create(category_name: "Sports")
# Category.create(category_name: "Crime")
# Category.create(category_name: "Animated")
# Category.create(category_name: "Reality")
# Category.create(category_name: "Adventure")
# Category.create(category_name: "Comedy")
# Category.create(category_name: "Docementary")
# Category.create(category_name: "Kids")
# Category.create(category_name: "Romantic")
# Category.create(category_name: "Fantasy")
# Category.create(category_name: "History")


# Tvshow.create(id: 17,name: "Band Of Brothers", categories_id: 2, year: 2001, no_seasons: 1, language: "ENGLISH | Dutch | French | German | Lithuanian",
#  rating: 9.6, aired_on: "05/10/2001", storyline: 
# 	"The story of Easy Company of the US Army 101st Airborne division and their mission in WWII Europe from Operation Overlord through V-J Day.",
# 	  director: "Scott Grimes, Damian Lewis, Ron Livingston",
# 	cast: "Scott Grimes	..Donald G. Malarkey (10 episodes, 2001)
# Damian Lewis	..Richard D. Winters (10 episodes, 2001)
# Ron Livingston	..Lewis Nixon (10 episodes, 2001)
# Shane Taylor	..Eugene G. Roe (10 episodes, 2001)
# Donnie Wahlberg	..C. Carwood Lipton (10 episodes, 2001)
# Peter Youngblood Hills	..Darrell C. (Shifty) Powers (10 episodes, 2001)
# Matthew Leitch	..Floyd M. (Tab) Talbert (10 episodes, 2001)
# Rod Strohl	..Himself (10 episodes, 2001)
# Nicholas Aaron	..Robert E. (Popeye) Wynn (9 episodes, 2001)
# ", image: "/bandofbrothers.jpg")
# Tvshow.create(id: 18,name: "Band Of Brothers", categories_id: 1, year: 2001, no_seasons: 1, language: "ENGLISH | Dutch | French | German | Lithuanian",
#  rating: 9.6, aired_on: "05/10/2001", storyline: 
# 	"The story of Easy Company of the US Army 101st Airborne division and their mission in WWII Europe from Operation Overlord through V-J Day.",
# 	  director: "Scott Grimes, Damian Lewis, Ron Livingston",
# 	cast: "Scott Grimes	..Donald G. Malarkey (10 episodes, 2001)
# Damian Lewis	..Richard D. Winters (10 episodes, 2001)
# Ron Livingston	..Lewis Nixon (10 episodes, 2001)
# Shane Taylor	..Eugene G. Roe (10 episodes, 2001)
# Donnie Wahlberg	..C. Carwood Lipton (10 episodes, 2001)
# Peter Youngblood Hills	..Darrell C. (Shifty) Powers (10 episodes, 2001)
# Matthew Leitch	..Floyd M. (Tab) Talbert (10 episodes, 2001)
# Rod Strohl	..Himself (10 episodes, 2001)
# Nicholas Aaron	..Robert E. (Popeye) Wynn (9 episodes, 2001)
# ", image: "/bandofbrothers.jpg")
# Tvshow.create(id: 19,name: "Band Of Brothers", categories_id: 17, year: 2001, no_seasons: 1, language: "ENGLISH | Dutch | French | German | Lithuanian",
#  rating: 9.6, aired_on: "05/10/2001", storyline: 
# 	"The story of Easy Company of the US Army 101st Airborne division and their mission in WWII Europe from Operation Overlord through V-J Day.",
# 	  director: "Scott Grimes, Damian Lewis, Ron Livingston",
# 	cast: "Scott Grimes	..Donald G. Malarkey (10 episodes, 2001)
# Damian Lewis	..Richard D. Winters (10 episodes, 2001)
# Ron Livingston	..Lewis Nixon (10 episodes, 2001)
# Shane Taylor	..Eugene G. Roe (10 episodes, 2001)
# Donnie Wahlberg	..C. Carwood Lipton (10 episodes, 2001)
# Peter Youngblood Hills	..Darrell C. (Shifty) Powers (10 episodes, 2001)
# Matthew Leitch	..Floyd M. (Tab) Talbert (10 episodes, 2001)
# Rod Strohl	..Himself (10 episodes, 2001)
# Nicholas Aaron	..Robert E. (Popeye) Wynn (9 episodes, 2001)
# ", image: "/bandofbrothers.jpg")

# Season.create(season_name: "Season 1", tvshows_id: 1, year: 2010, season_overview:
#  "John Watson, army doctor, invalided home from Afghanistan, alone and friendless.
#  Sherlock Holmes, the most brilliant intellect of his generation, alone and friendless.
#  London 2010 – the best and longest friendship in all of fiction is about to begin anew. The most famous detective,
#  the most baffling mysteries, the most thrilling adventures and the deadliest foes, are coming in out of the fog.
#  Sherlock Holmes was always a modern man – it was the world that got old.
#  Now he’s back as he should be – edgy, contemporary, difficult, dangerous.
#  Inspector Lestrade is the best Scotland Yard has got, but he knows he’s not as good as a strange young man called Sherlock.",
#   rating: 8.1, image: "/sherlock.jpg", language: "English", no_episodes: 3 )

Episode.create(episode_name: "Episode 01 - Pilot", seasons_id: 1, episode_description:
	"When an unassuming high school chemistry teacher discovers he has a rare form of lung cancer, 
	he decides to team up with a former student and create a top of the line crystal meth in a used RV,
	 to provide for his family once he is gone.",
	 air_date: "2008-01-19", rating: 7.7, image: "/breakingbads01e01.jpg"
	)

# SeasonReview.create(tvshows_id: 1, users_id: 6, review: "Awesome show.")