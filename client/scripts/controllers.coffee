'use strict'

### Controllers ###

angular.module('clockApp.controllers', ['clockApp.services', 'clockApp.filters'])

.controller('AboutCtrl', ["$scope", ($scope) ->
  $scope.occupation = ""
  $scope.location   = ""
  $scope.salaryTypes = ["hour"]
  $scope.salaryType  = $scope.salaryTypes[0]

  $scope.saveable = -> @aboutMeForm.$dirty and @aboutMeForm.$valid
  ])

.controller('ClockCtrl', ["$scope", "pageTimer", "pluralizeFilter", ($scope, timer, pluralize) ->
  $scope.clockTime = ->
    totals = timer.seconds
    totalm = Math.floor(totals / 60)
    h = Math.floor(totalm / 60)
    m = totalm - h * 60
    s = totals - totalm * 60

    timeStr = pluralize(s, "second")
    timeStr = "#{pluralize(m, 'minute')} and #{timeStr}" if m > 0 or h > 0
    timeStr = "#{pluralize(h, 'hour')}, #{timeStr}" if h > 0
    timeStr

  ])

.controller('CmpInfoCtrl', ["$scope", "pageTimer", ($scope, timer) ->
  $scope.cmpExamples = [
    {occupation: "Walmart greeter",   location: "Kansas",       hourly: 8.73    }
    {occupation: "plumber",           location: "Madison",      hourly: 37.21   }
    {occupation: "software firm CEO", location: "Redwood City", hourly: 48080.35}
  ]

  $scope.earnedAmt = (hourly) ->
    amt = hourly * timer.seconds / 3600
    if amt < 0.01 then "less than $0.01" else "$#{amt.toFixed(2)}"

  ])
