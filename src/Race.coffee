class Race
	constructor: (@venue, @country, @date) -> 

	id: ""
	venue: ""
	country: ""
	date: null

	# an ordered list of FinalStandings
	driverFinalStandings: [] #DriverFinalStandings
	teamFinalStandings: []   #TeamFinalStandings


	# do we need to define the qualifying results? or just take in a json object?
	setQualifyingResults: (qualifyingResults) =>
		@driverFinalStandings = for driver, i in qualifyingResults
			new DriverStanding(driver, i)


	# do we need to define the race results? or just take in a json object?
	setFinalRaceResults: (raceResults) =>
		@driverFinalStandings = for standing, i in @driverFinalStandings
			standing.finished = getIndex(standing.driver.id, raceResults)
			#standing.finished = selectIndex(raceResults, (driver) -> driver.id = standing.driver.id then true else false) 
			standing.fastestLap = raceResults[standing.finished].fastestLap
			standing

	
	getIndex: (driverId, list) ->
		pos = 99
		for driver, i in list
			if driver.id = driverId
				return i
		99

	selectIndex: (list, func) ->
		for item, i in list
			if func(item) 
				return i
		99

	# linq like select method
	select: (list, func) ->
		for item in list
			if (func(item))
				return item
		null




root = exports ? window
root.Race = Race