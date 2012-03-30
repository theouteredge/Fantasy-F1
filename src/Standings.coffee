class FinalStanding
	constructor: (@qualified, @finished, @racePoints) ->

	qualified: -1
	finished: -1
	racePoints: 0
	

	improvementPoints: ->
		console.log " >> improvement points: quali #{@qualified}  finished #{@finished}"

		if (@qualified is undefined or @finished is undefined)
			return 0

		if @qualified < @finished
			@qualified - @finished
		else
			0

	totalPoints: ->
		console.log " >> race points: #{@racePoints}"

		if (@racePoints is undefined)
			return 0

		@improvementPoints() + @racePoints




class TeamStanding extends FinalStanding
	constructor: (@team, qualified, finished, racePoints) -> 
		super(qualified, finished, racePoints)

	team: null




class DriverStanding extends FinalStanding
	constructor: (@driver, qualified, finished, racePoints) -> 
		super(qualified, finished, racePoints)
		
		@polePosition = false
		@fastestLap = false

	driver: null
	
	polePosition: false
	fastestLap: false


	totalPoints: ->
		console.log " > calling super.totalPoints()"

		total = super

		console.log " > pole: #{@polePosition}"
		console.log " > fastestLap: #{@fastestLap}"
		console.log " > finished: #{@finished}"
		console.log " > pole: #{@total}"

		# bonus 5 points for pole, win & fastest lap
		if @polePosition and @fastestLap and @finished = 1
			return super() + 5

		if @polePosition
			total = total + 1 

		if @fastestLap
			total = total + 1

		total
	



root = exports ? window

root.DriverStanding = DriverStanding
root.TeamStanding = TeamStanding