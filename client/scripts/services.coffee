'use strict'

class PageTimer
  constructor: ($interval) ->
    @$interval = $interval
    @seconds = 0

  incr: => @seconds = Math.round(((new Date) - @startTime) / 1000)

  start: ->
    @startTime = new Date
    @seconds = 0
    @$interval @incr, 1000

  started: -> @startTime?

### Services ###

angular.module('clockApp.services', [])

.service('pageTimer', ["$interval", PageTimer])
