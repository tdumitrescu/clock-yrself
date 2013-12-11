'use strict'

### Filters ###

angular.module('clockApp.filters', [])

.filter("indefArticle", -> (s) -> "a#{if /^[aeiou].*/.test(s) then 'n' else ''}")

.filter("indefArticlize", ["indefArticleFilter", (indefArticle) ->
  (s) -> "#{indefArticle(s)} #{s}"
])

.filter('interpolate', [
  'version',

(version) ->
  (text) ->
    String(text).replace(/\%VERSION\%/mg, version)
])
