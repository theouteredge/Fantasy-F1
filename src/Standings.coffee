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




class TeamStanding extends finalStanding
	team: null




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
	





root = exports ? window

root.DriverStanding = DriverStanding
root.TeamStanding = TeamStanding