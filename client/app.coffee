'use strict'

# Declare app level module which depends on filters, and services
angular.module('myApp', [
  'ngCookies', 'ngResource', 'ngRoute',
  'myApp.controllers', 'myApp.directives', 'myApp.filters', 'myApp.services'
  'partials'
])
