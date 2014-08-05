'use strict'

angular.module('app.controllers.registry', [])

.controller('RegistryCtrl', [
  '$scope'
  'store'
  'actors'

  ($scope, store, actors) ->
    $scope.anagrafica = {removed: false}
    $scope.actors = actors

    $scope.getCssClasses = (ngModelController) ->
      'has-error' : ngModelController.$invalid && ngModelController.$dirty
      'has-success' : ngModelController.$valid && ngModelController.$dirty

    $scope.showError = (ngModelController, error) ->
      ngModelController.$error[error] unless ngModelController.$pristine

    $scope.canSave = ->
      $scope.anagraficaForm.$dirty && $scope.anagraficaForm.$valid

    $scope.canDelete = ->
      $scope.anagrafica._id?

    $scope.isNew = ->
      $scope.anagraficaForm.$pristine

    $scope.disabled = ->
      ($scope.anagraficaForm.$dirty && $scope.anagraficaForm.$valid) ? 'disabled' : ''

    $scope.setSelected = (selected) ->
      store.findOne { _id: selected._id }, (err, doc) ->
        $scope.anagrafica = doc
        $scope.$apply()

    $scope.all = ->
      store.find

    $scope.reportChange = ->
      console.log "showView: #{$scope.showView()}"

    $scope.showView = ->
      if $scope.showList
        'partials/registry/list.html'
      else
        'partials/registry/table.html'

    $scope.saveActor = ->
      if $scope.anagrafica._id?
        store.update {_id: $scope.anagrafica._id}, $scope.anagrafica, ->
          console.log "item updated"
          for key, value of $scope.actors
            if value._id == $scope.anagrafica._id
              $scope.actors.splice(key, 1, $scope.anagrafica)
          resetForm()
          $scope.$apply()
      else
        store.insert $scope.anagrafica, (err, newDoc) ->
          if newDoc
            console.log "new item inserted"
            $scope.actors.push(newDoc)
            resetForm()
            $scope.$apply()

    $scope.deleteActor = ->
      console.log "calling delete..."
      if confirm("Confermi?")
        for key, value of $scope.actors
          if value._id == $scope.anagrafica._id
            $scope.actors[key].removed = true
            # $scope.actors.splice(key, 1)
            # store.remove { _id: $scope.anagrafica._id }, {}, (err, numRemoved) ->
            #   console.log "item removed"

        resetForm()

    $scope.newActor = ->
      resetForm()

    resetForm = ->
      $scope.anagrafica = {removed: false}
      $scope.anagraficaForm.$setPristine()



])
