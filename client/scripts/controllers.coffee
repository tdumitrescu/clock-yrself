'use strict'

### Controllers ###

angular.module('clockApp.controllers', ['clockApp.services', 'clockApp.directives', 'clockApp.filters'])

.controller('MainCtrl', ["$scope", "$cookies", "pageTimer", ($scope, $cookies, timer) ->
  $scope.timerPaused  = -> timer.paused()
  $scope.timerStarted = -> timer.started()
  $scope.pauseTimer   = -> timer.pause()
  $scope.resetTimer   = -> timer.reset()
  $scope.resumeTimer  = -> timer.resume()
  $scope.salaryTypes = ["hour", "year"]
  $scope.user =
    occupation: ""
    location:   ""
    salaryType: $scope.salaryTypes[0]

  if $cookies.user_ex?
    savedEx = JSON.parse($cookies.user_ex.slice(2))
    $scope.user.occupation = savedEx.occupation
    $scope.user.location   = savedEx.location
    $scope.user.salaryType = savedEx.salaryType
    $scope.user.salary     = savedEx.salary

  $scope.earnedAmt = (u) ->
    divisor = if u.salaryType is "year" then 7200000 else 3600
    "#{(u.salary * timer.totalSeconds / divisor).toFixed(2)}"

  $scope.exSalary = (u) -> "$#{u.salary} per #{u.salaryType}"
  $scope.exTitle  = (u) -> "#{u.occupation} in #{u.location}"
])

.controller('AboutCtrl', ["$scope", "$http", "pageTimer", ($scope, $http, timer) ->
  $scope.saveable = -> !timer.started() and @aboutMeForm.$valid
  $scope.submit   = ->
    $http.post("/api/ex", $scope.user) if @aboutMeForm.$dirty
    timer.start()
])

.controller('ClockCtrl', ["$scope", "pageTimer", "zerofillFilter", ($scope, timer, zerofill) ->
  $scope.clockTime = ->
    totals = timer.totalSeconds
    totalm = Math.floor(totals / 60)
    h = Math.floor(totalm / 60)
    m = totalm - h * 60
    s = totals - totalm * 60

    "#{zerofill(h, 2)}:#{zerofill(m, 2)}:#{zerofill(s, 2)}"
])

.controller('CmpInfoCtrl', ["$scope", "$http", ($scope, $http) ->
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
    .success((data) -> $scope.cmpExamples = data.examples)
    .error(-> $scope.cmpExamples = $scope.defaultData)
])
