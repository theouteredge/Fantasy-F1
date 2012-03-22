class FinalStanding
	qualified: -1
	finished: -1
	racePoints: 0
	
	improvementPoints: =>
		if qualified < finished
			qualified - finished
		else
			0

	totalPoints: =>
		racePoints + improvementPoints()


class DriverStanding extends finalStanding
	constructor: (@driver, @qualified) -> 

	driver: null
	
	polePosition: false
	fastestLap: false

	improvementPoints: =>
		if qualified < finished
			qualified - finished
		else
			0

	totalPoints: =>
		total = racePoints + improvementPoints()

		# bonus 5 points for pole, win & fastest lap
		if polePosition and fastestLap and finished = 1
			return super() + 5

		total = total + 1 if polePosition
		total = total + 1 if fastestLap
	

class TeamStanding extends finalStanding
	team: null


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
root.DriverStanding = DriverStanding
root.TeamStanding = TeamStanding