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

 	payoutStructure: [0.6, 0.3, 0.1]



root = exports ? window;
root.Competition = Competition