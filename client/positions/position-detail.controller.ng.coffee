'use strict'

angular.module 'atsApp'
.controller 'PositionDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.position = $scope.$meteorObject Positions, $stateParams.positionId, false
  $scope.$meteorSubscribe('positions')

  $scope.companies = $scope.$meteorCollection () ->
    Companies.find {}, {sort:$scope.getReactively('sort')}

  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('companies')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.position.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $state.go 'positions-list'
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.position.reset()
