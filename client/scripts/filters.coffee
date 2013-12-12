'use strict'

### Filters ###

angular.module('clockApp.filters', [])

.filter("indefArticle", -> (s) -> "a#{if /^[aeiou].*/.test(s) then 'n' else ''}")

.filter("indefArticlize", ["indefArticleFilter", (indefArticle) ->
  (s) -> "#{indefArticle(s)} #{s}"
])

.filter("pluralize", -> (i, s) -> "#{i} #{s}#{if i is 1 then '' else 's'}")
