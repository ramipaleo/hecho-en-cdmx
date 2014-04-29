'use strict'

angular
  .module('cdmxApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ui.bootstrap',
    'ngClipboard'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
  .config ['ngClipProvider', (ngClipProvider) ->
    ngClipProvider.setPath 'bower_components/zeroclipboard/ZeroClipboard.swf'
  ]
