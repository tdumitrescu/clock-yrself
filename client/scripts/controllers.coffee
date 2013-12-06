'use strict'

### Controllers ###

angular.module('clockApp.controllers', ['clockApp.services'])

.controller('AboutCtrl', ["$scope", ($scope) ->
  $scope.occupation = ""
  $scope.location   = ""

  ])

.controller('ClockCtrl', ["$scope", "pageTimer", ($scope, timer) ->
  $scope.clockTime = -> "#{timer.seconds} seconds"

  ])
