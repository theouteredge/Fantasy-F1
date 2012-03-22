class Driver
	constructor: (@id, @year, @cost, @name, @carNo, @pictureUrl, @team) ->

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


root = exports ? window;
root.Driver = Driver