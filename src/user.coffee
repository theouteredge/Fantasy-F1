class User
	id: ""
	Name: ""
	Email: ""
	Password: ""
	Teams: []


class PlayerTeam
	id: ""
	Name: ""
	Owner: null
	Drivers: []
	Teams: []

	addTeam: (team) =>
		true

	addDriver: (driver) =>
		true
