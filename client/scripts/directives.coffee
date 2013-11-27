'use strict'

### Directives ###

# register the module with Angular
angular.module('clockApp.directives', [
  # require the 'clockApp.services' module
  'clockApp.services'
])

.directive('appVersion', [
  'version'

(version) ->

  (scope, elm, attrs) ->
    elm.text(version)
])
