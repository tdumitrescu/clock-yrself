'use strict'

class PageTimer
  constructor: ($interval) ->
    @startTime = new Date
    @seconds = 0
    $interval @incr, 1000

  incr: => @seconds = Math.round(((new Date) - @startTime) / 1000)

### Services ###

angular.module('clockApp.services', [])

.service('pageTimer', ["$interval", PageTimer])
