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
		racePoints + improvementPoints


class DriverStanding extends finalStanding
	constructor: -> (@driver, @qualified)

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

		if polePosition and fastestLap and finished = 1
			return super() + 5

		total = total + 1 if polePosition
		total = total + 1 if fastestLap
	

class TeamStanding extends finalStanding
	team: null


class Race
	venue: ""
	country: ""
	date: null

	# an ordered list of FinalStandings
	driverFinalStandings: [] #DriverFinalStandings
	teamFinalStandings: []   #TeamFinalStandings

	setQualifyingResults: (qualifyingResults) =>
		@driverFinalStandings = for driver, i in qualifyingResults
			new DriverStanding(driver, i)

	setFinalRaceResults: (raceResults) =>
		@driverFinalStandings = for standing, i in @driverFinalStandings
			standing.finished = getPosition(standing.driver.id, raceResults) 
			standing

	getPosition: (driverId, list) ->
		pos = 99
		for driver, i in list
			if driver.id = driverId
				pos = i
				break

		pos






root = exports ? window

root.Race = Race
root.DriverStanding = DriverStanding
root.TeamStanding = TeamStanding