standings = require './Standings'

class Race
	constructor: (@id, @venue, @country, @date) -> 
		@driverFinalStandings = []
		@teamFinalStandings = []

	id: ""
	venue: ""
	country: ""
	date: null

	#DriverStanding[] ordered
	driverFinalStandings: null
	
	#TeamStanding[] ordered
	teamFinalStandings: null


	# do we need to define the qualifying results? or just take in a json object?
	setQualifyingResults: (qualifyingResults) ->
		@driverFinalStandings = for driver, i in qualifyingResults
			new standings.DriverStanding(driver, i+1)


	# do we need to define the race results? or just take in a json object?
	setFinalRaceResults: (raceResults, racePoints) ->
		@driverFinalStandings = for standing in @driverFinalStandings
			standing.finished = @selectIndex(raceResults, (driver) -> driver.id is standing.driver.id) + 1
			standing.fastestLap = raceResults[standing.finished-1]?.fastestLap
			
			if standing.finished <= racePoints.length
				standing.racePoints = racePoints[standing.finished-1] 

			standing


	selectIndex: (list, func) ->
		for item, i in list
			if func(item) 
				return i
		-1

	# linq like select method
	select: (list, func) ->
		for item in list
			if (func(item))
				return item
		null




root = exports ? window
root.Race = Race