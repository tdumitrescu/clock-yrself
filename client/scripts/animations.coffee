'use strict'

angular.module('clockApp.animations', [])

.animation('.slide', ->

  @slide = (dir, el, done) ->
    animAttrs = {}
    animAttrs["max-height"] = if dir is "out" then 0 else 500
    jQuery(el).animate animAttrs, done
    ->

  enter: (el, done) => @slide "in",  el, done
  leave: (el, done) => @slide "out", el, done

)
