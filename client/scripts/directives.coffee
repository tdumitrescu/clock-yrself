'use strict'

### Directives ###

# register the module with Angular
angular.module('clockApp.directives', [])

.directive('blockyText', ->
  restrict: 'E'
  scope:    text: '='
  template:
    """
    <span class="td-blocky-text">
      <span class="td-blocky-text-char" ng-repeat="c in chars(text) track by $index">
        {{c}}
      </span>
    </span>
    """
  replace:  true
  link: (scope) ->
    scope.chars = (s) -> s.split('')

)
