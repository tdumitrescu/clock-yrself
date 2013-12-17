'use strict'

### Directives ###

# register the module with Angular
angular.module('clockApp.directives', [])

.directive('blockyText', ->
  restrict: 'E'
  scope:
    text:    '='
    divider: '@'
  template:
    """
    <span class="td-blocky-text">
      <span class="td-blocky-text-char"
            ng-repeat="c in text track by $index"
            ng-class="{divider: isDivider(c)}">
        {{c}}
      </span>
    </span>
    """
  replace:  true
  link: (scope) ->
    scope.isDivider = (c) -> c is scope.divider

)
