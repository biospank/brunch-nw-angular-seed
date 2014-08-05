'use strict'

### Directives ###

# register the module with Angular
angular.module('app.directives.autofocusonpristine', [])

.directive('autofocusOnPristine', [ ->
  restrict: 'A'
  link: (scope, element, attr) ->
    #console.log "autofocus called!!"
    scope.$watch("isNew()", ->
      element[0].focus()
    )

])
