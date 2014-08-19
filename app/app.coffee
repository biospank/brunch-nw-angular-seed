'use strict'

# Declare app level module which depends on filters, and services
angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
])

.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

  $routeProvider

    .when '/todo',
      templateUrl: 'partials/todo.html'
      controller: 'TodoCtrl'
    .when '/registry/new',
      templateUrl: 'partials/registry/new.html'
      controller: 'RegistryCtrl'
      resolve:
        actors: (store) ->
          items = []
          store.find {}, (err, docs) ->
            items.concat([{cognome: 'Petrucci', 'Fabio'}])

          items
    # .when '/registry/edit/:regid',
    #   templateUrl: '/partials/registry/edit.html'
    #   controller: 'RegistryCtrl'
    .when('/view1',      {templateUrl: 'partials/partial1.html'})
    .when('/view2',      {templateUrl: 'partials/partial2.html'})

    # Catch all
    .otherwise({redirectTo: '/todo'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
