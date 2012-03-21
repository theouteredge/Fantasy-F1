class Season
	year: 2012
	races: []
	teams: []
	drivers: []


class Competition
 	constructor: (@year, @name, @organiser) ->

 	id: ""
 	year: 2012
 	name: ""
 	organiser: null
 	invitationCode: ""

 	public: false
 	entryFee: 0.0
 	playerTeams: []

 	payoutStructure: [0.5, 0.3, 0.2]



class Team
	id: ""
	year: 2012
	cost: 0

	name: ""
	logoUrl: ""

	seasonScore: 0
	lastRaceScore: 0

	drivers: []
	results: []
	

class Driver
	id: ""
	year: 2012
	cost: 0

	name: ""
	carNo: 0
	pictureUrl: ""

	team: null

	seasonScore: 0
	lastRaceScore: 0

	results: []

