'use strict'

class PageTimer
  constructor: ($interval) ->
    @$interval = $interval
    @currentSeconds = @totalSeconds = 0

  incr: =>
    @currentSeconds = Math.round(((new Date) - @currentStartTime) / 1000)
    @totalSeconds = @secondsAtStart + @currentSeconds

  pause: ->
    @$interval.cancel @$i
    @currentStartTime = null

  restartTimer: ->
    @currentStartTime = new Date
    @currentSeconds = 0
    @secondsAtStart = @totalSeconds
    @$i = @$interval @incr, 1000

  reset: ->
    @totalSeconds = 0
    @start()

  resume: -> @restartTimer()

  start: ->
    @restartTimer()
    @origStartTime = @currentStartTime

  paused:  -> !@currentStartTime?
  started: -> @origStartTime?


angular.module('clockApp.services', [])

.service('pageTimer', ["$interval", PageTimer])
