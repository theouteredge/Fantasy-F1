# i was going to have a season class, but wondering if we need it or if we can use use the year as the idenifier to link everything together?
# but how would we know th active season? the current year...? would make sense...
class Season
	Year: 2012


class Competition
 	constructor: (year, name, owner) ->
 		@Year = year
 		@Name = name
 		@Organiser = Organiser

 	Year: 2012
 	Name: ""
 	Organiser: null
 	InvitationCode: ""

 	Public: false
 	EntryFee: 0.0
 	Players: []

 	Create: (name) ->
 		




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

