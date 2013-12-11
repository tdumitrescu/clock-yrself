'use strict'

class PageTimer
  constructor: ($interval) ->
    @startTime = new Date
    @seconds = 0
    $interval @incr, 1000

  incr: => @seconds = Math.round(((new Date) - @startTime) / 1000)

#TODO find a better place for global utils
class Helpers
  @indefArticleFor: (s) -> "a#{if /^[aeiou].*/.test(s) then 'n' else ''}"
  @indefArticlize:  (s) -> "#{Helpers.indefArticleFor(s)} #{s}"

### Services ###

angular.module('clockApp.services', [])

.factory('version', -> "0.1")

.service('pageTimer', ["$interval", PageTimer])
