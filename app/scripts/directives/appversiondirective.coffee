'use strict'

angular.module('app.directives.appversion', [])

.directive('appVersion', [
  'version'

(version) ->

  (scope, elm, attrs) ->
    elm.text(version)
])
