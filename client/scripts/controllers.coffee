'use strict'

### Controllers ###

angular.module('clockApp.controllers', [])

.controller('AboutCtrl', ["$scope", ($scope) ->
  $scope.occupation = ""
  $scope.location   = ""

  ])
