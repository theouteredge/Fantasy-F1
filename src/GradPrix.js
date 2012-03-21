(function() {
  var DriverStanding, FinalStanding, Race, TeamStanding, root,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  FinalStanding = (function() {

    function FinalStanding() {
      this.totalPoints = __bind(this.totalPoints, this);
      this.improvementPoints = __bind(this.improvementPoints, this);
    }

    FinalStanding.prototype.qualified = -1;

    FinalStanding.prototype.finished = -1;

    FinalStanding.prototype.racePoints = 0;

    FinalStanding.prototype.improvementPoints = function() {
      if (qualified < finished) {
        return qualified - finished;
      } else {
        return 0;
      }
    };

    FinalStanding.prototype.totalPoints = function() {
      return racePoints + improvementPoints();
    };

    return FinalStanding;

  })();

  DriverStanding = (function(_super) {

    __extends(DriverStanding, _super);

    function DriverStanding(driver, qualified) {
      this.driver = driver;
      this.qualified = qualified;
      this.totalPoints = __bind(this.totalPoints, this);
      this.improvementPoints = __bind(this.improvementPoints, this);
    }

    DriverStanding.prototype.driver = null;

    DriverStanding.prototype.polePosition = false;

    DriverStanding.prototype.fastestLap = false;

    DriverStanding.prototype.improvementPoints = function() {
      if (qualified < finished) {
        return qualified - finished;
      } else {
        return 0;
      }
    };

    DriverStanding.prototype.totalPoints = function() {
      var finished, total;
      total = racePoints + improvementPoints();
      if (polePosition && fastestLap && (finished = 1)) {
        return DriverStanding.__super__.totalPoints.call(this) + 5;
      }
      if (polePosition) total = total + 1;
      if (fastestLap) return total = total + 1;
    };

    return DriverStanding;

  })(finalStanding);

  TeamStanding = (function(_super) {

    __extends(TeamStanding, _super);

    function TeamStanding() {
      TeamStanding.__super__.constructor.apply(this, arguments);
    }

    TeamStanding.prototype.team = null;

    return TeamStanding;

  })(finalStanding);

  Race = (function() {

    function Race(venue, country, date) {
      this.venue = venue;
      this.country = country;
      this.date = date;
      this.setFinalRaceResults = __bind(this.setFinalRaceResults, this);
      this.setQualifyingResults = __bind(this.setQualifyingResults, this);
    }

    Race.prototype.id = "";

    Race.prototype.venue = "";

    Race.prototype.country = "";

    Race.prototype.date = null;

    Race.prototype.driverFinalStandings = [];

    Race.prototype.teamFinalStandings = [];

    Race.prototype.setQualifyingResults = function(qualifyingResults) {
      var driver, i;
      return this.driverFinalStandings = (function() {
        var _len, _results;
        _results = [];
        for (i = 0, _len = qualifyingResults.length; i < _len; i++) {
          driver = qualifyingResults[i];
          _results.push(new DriverStanding(driver, i));
        }
        return _results;
      })();
    };

    Race.prototype.setFinalRaceResults = function(raceResults) {
      var i, standing;
      return this.driverFinalStandings = (function() {
        var _len, _ref, _results;
        _ref = this.driverFinalStandings;
        _results = [];
        for (i = 0, _len = _ref.length; i < _len; i++) {
          standing = _ref[i];
          standing.finished = getIndex(standing.driver.id, raceResults);
          standing.fastestLap = raceResults[standing.finished].fastestLap;
          _results.push(standing);
        }
        return _results;
      }).call(this);
    };

    Race.prototype.getIndex = function(driverId, list) {
      var driver, i, pos, _len;
      pos = 99;
      for (i = 0, _len = list.length; i < _len; i++) {
        driver = list[i];
        if (driver.id = driverId) return i;
      }
      return 99;
    };

    Race.prototype.selectIndex = function(list, func) {
      var i, item, _len;
      for (i = 0, _len = list.length; i < _len; i++) {
        item = list[i];
        if (func(item)) return i;
      }
      return 99;
    };

    Race.prototype.select = function(list, func) {
      var item, _i, _len;
      for (_i = 0, _len = list.length; _i < _len; _i++) {
        item = list[_i];
        if (func(item)) return item;
      }
      return null;
    };

    return Race;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.Race = Race;

  root.DriverStanding = DriverStanding;

  root.TeamStanding = TeamStanding;

}).call(this);
