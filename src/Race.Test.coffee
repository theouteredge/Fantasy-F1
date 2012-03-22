Race = require './Race'
Driver = require './Driver'

race = new Race.Race "race/1", "Albert Park, Melbourn", "Austrailia", new Date(2012, 03, 17)
console.log race

drivers = for i in [1..10]
	new Driver.Driver('driver/' + i, 2012)


race.setQualifyingResults drivers

console.log race.driverFinalStandings
console.log race.driverFinalStandings[0].totalPoints()
console.log race.driverFinalStandings[0].improvementPoints()