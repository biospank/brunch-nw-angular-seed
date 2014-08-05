'use strict'

angular.module('app.services.store', [])

.factory 'store', ->
  new Nedb()
# .value 'store', ->
#   DataStore.create('document')
