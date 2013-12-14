'use strict'

### Controllers ###

angular.module('clockApp.controllers', ['clockApp.services', 'clockApp.directives', 'clockApp.filters'])

.controller('MainCtrl', ["$scope", "pageTimer", ($scope, timer) ->
  $scope.timerStarted = -> timer.started()
])

.controller('AboutCtrl', ["$scope", "pageTimer", ($scope, timer) ->
  $scope.occupation  = ""
  $scope.location    = ""
  $scope.salaryTypes = ["hour", "year"]
  $scope.salaryType  = $scope.salaryTypes[0]

  $scope.saveable = -> !timer.started() and @aboutMeForm.$dirty and @aboutMeForm.$valid
  $scope.submit   = -> timer.start()
])

.controller('ClockCtrl', ["$scope", "pageTimer", "zerofillFilter", ($scope, timer, zerofill) ->
  $scope.clockTime = ->
    totals = timer.seconds
    totalm = Math.floor(totals / 60)
    h = Math.floor(totalm / 60)
    m = totalm - h * 60
    s = totals - totalm * 60

    "#{zerofill(h, 2)}:#{zerofill(m, 2)}:#{zerofill(s, 2)}"
])

.controller('CmpInfoCtrl', ["$scope", "$http", "pageTimer", ($scope, $http, timer) ->
  $scope.defaultData = [
    {
      occupation: "Walmart greeter",   location: "Kansas"
      salaryType: "hour",              salary: 8.73
    }
    {
      occupation: "plumber",           location: "Madison"
      salaryType: "hour",              salary: 37.21
    }
    {
      occupation: "software firm CEO", location: "Redwood City"
      salaryType: "year",              salary: 96160696
    }
  ]
  $http.get("/api/exx")
    .success(
      (data) -> $scope.cmpExamples = data.examples
    )
    .error(
      -> $scope.cmpExamples = $scope.defaultData
    )

  $scope.earnedAmt = (ex) ->
    divisor = if ex.salaryType is "year" then 7200000 else 3600
    "#{(ex.salary * timer.seconds / divisor).toFixed(2)}"
])
