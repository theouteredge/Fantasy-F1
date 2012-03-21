(function() {
  var Competition, CompetitionPayoutStructure, Driver, Season, Team,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Season = (function() {

    function Season() {}

    Season.prototype.Year = 2012;

    return Season;

  })();

  Competition = (function() {

    function Competition(year, name, organiser) {
      this.create = __bind(this.create, this);      this.Year = year;
      this.Name = name;
      this.Organiser = organiser;
    }

    Competition.prototype.Year = 2012;

    Competition.prototype.Name = "";

    Competition.prototype.Organiser = null;

    Competition.prototype.InvitationCode = "";

    Competition.prototype.Public = false;

    Competition.prototype.EntryFee = 0.0;

    Competition.prototype.PlayerTeams = [];

    Competition.prototype.create = function(name, year, organiser) {
      return true;
    };

    return Competition;

  })();

  CompetitionPayoutStructure = (function() {

    function CompetitionPayoutStructure() {}

    return CompetitionPayoutStructure;

  })();

  Team = (function() {

    function Team() {}

    Team.prototype.Year = 2012;

    Team.prototype.Cost = 0;

    Team.prototype.Name = "";

    Team.prototype.LogoUrl = "";

    Team.prototype.SeasonScore = 0;

    Team.prototype.LastRaceScore = 0;

    Team.prototype.Drivers = [];

    Team.prototype.Results = [];

    return Team;

  })();

  sessionClient;

  Driver = (function() {

    function Driver() {}

    Driver.prototype.Year = 2012;

    Driver.prototype.Cost = 0;

    Driver.prototype.Name = "";

    Driver.prototype.PictureUrl = "";

    Driver.prototype.Team = null;

    Driver.prototype.SeasonScore = 0;

    Driver.prototype.LastRaceScore = 0;

    Driver.prototype.Results = [];

    return Driver;

  })();

}).call(this);
