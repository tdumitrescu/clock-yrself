'use strict'

# Declare app level module which depends on filters, and services
angular.module('clockApp', [
  'ngCookies', 'ngResource', 'ngRoute', 'ngAnimate',
  'clockApp.controllers', 'clockApp.directives', 'clockApp.filters',
  'clockApp.services', 'clockApp.animations',
  'partials'
])
