'use strict'

### Filters ###

angular.module('app.filters.interpolate', [])

.filter('interpolate', [
  'version',

(version) ->
  (text) ->
    String(text).replace(/\%VERSION\%/mg, version)
])
