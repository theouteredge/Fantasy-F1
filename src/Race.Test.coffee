Race = require './Race'
Driver = require './Driver'

race = new Race.Race "race/1", "Albert Park, Melbourn", "Austrailia", new Date(2012, 03, 17)
console.log race

drivers = for i in [1..10]
	new Driver.Driver('driver/' + i, 2012)


race.setQualifyingResults drivers
console.log ""
console.log "qualifying results set"
console.log "-------------------------------------------"
console.log race.driverFinalStandings


race.setFinalRaceResults drivers, [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
console.log ""
console.log "final race results set"
console.log "-------------------------------------------"
console.log race.driverFinalStandings




console.log "total points: #{race.driverFinalStandings[0].totalPoints()}"
console.log "improvement points: #{race.driverFinalStandings[0].improvementPoints()}"