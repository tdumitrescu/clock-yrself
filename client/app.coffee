'use strict'

# Declare app level module which depends on filters, and services
angular.module('clockApp', [
  'ngCookies', 'ngResource', 'ngRoute',
  'clockApp.controllers', 'clockApp.directives', 'clockApp.filters', 'clockApp.services'
  'partials', 'timer'
])
