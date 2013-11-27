'use strict'

### Controllers ###

angular.module('myApp.controllers', [])

.controller('AboutCtrl', ["$scope", ($scope) ->
  $scope.occupation = ""
  $scope.location   = ""

  ])
