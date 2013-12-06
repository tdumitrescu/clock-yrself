'use strict'

class PageTimer
  constructor: ($interval) ->
    @seconds = 0
    $interval @incr, 1000

  incr: => @seconds += 1

### Services ###

angular.module('clockApp.services', [])

.factory('version', -> "0.1")

.service('pageTimer', ["$interval", PageTimer])
