'use strict'

angular.module('app.directives.highlight', [])

.directive('highlight', [ ->
  restrict: 'A'
  link: (scope, element, attr) ->
    element.css('background-color', 'yellow') if element? && element.is(":focus")
])
