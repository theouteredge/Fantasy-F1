class Season
	Year: 2012


class User
	Name: ""
	Email: ""
	Password: ""
	Teams: []


class Competition
 	constructor: (year, name, owner) ->
 		@Year = year
 		@Name = name
 		@Owner = owner

 	Year: 2012
 	Name: ""
 	Owner: null


class Team
	Year: 2012
	Cost: 0

	Name: ""
	LogoUrl: ""

	SeasonScore: 0
	LastRaceScore: 0

	Drivers: []
	


class Driver
	Year: 2012
	Cost: 0

	Name: ""
	PictureUrl: ""

	Team: null

	SeasonScore: 0
	LastRaceScore: 0

