'use strict'

### Controllers ###

angular.module('clockApp.controllers', ['clockApp.services'])

.controller('AboutCtrl', ["$scope", ($scope) ->
  $scope.occupation = ""
  $scope.location   = ""

  $scope.occupationArticle = -> Helpers.indefArticleFor $scope.occupation

  ])

.controller('ClockCtrl', ["$scope", "pageTimer", ($scope, timer) ->
  $scope.clockTime = ->
    totals = timer.seconds
    totalm = Math.floor(totals / 60)
    h = Math.floor(totalm / 60)
    m = totalm - h * 60
    s = totals - totalm * 60

    timeStr = $scope.pluralize(s, "second")
    timeStr = "#{$scope.pluralize(m, 'minute')} and #{timeStr}" if m > 0 or h > 0
    timeStr = "#{$scope.pluralize(h, 'hour')}, #{timeStr}" if h > 0
    timeStr

  $scope.pluralize = (i, s) -> "#{i} #{s}#{if i is 1 then '' else 's'}"

  ])

.controller('CmpInfoCtrl', ["$scope", "pageTimer", ($scope, timer) ->
  $scope.location   = "Kansas"
  $scope.occupation = "Walmart greeter"
  $scope.salary     = 8.73

  $scope.earnedAmt = ->
    amt = $scope.salary * timer.seconds / 3600
    if amt < 0.01
      "less than $0.01"
    else
      "$#{amt.toFixed(2)}"

  $scope.occupationStr = -> Helpers.indefArticlize $scope.occupation

  ])
