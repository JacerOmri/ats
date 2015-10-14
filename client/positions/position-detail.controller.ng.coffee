'use strict'

angular.module 'atsApp'
.controller 'PositionDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.position = $scope.$meteorObject Positions, $stateParams.positionId
  $scope.$meteorSubscribe('positions')

  $scope.companies = $scope.$meteorCollection () ->
    Companies.find {}, {sort:$scope.getReactively('sort')}

  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('companies', {
      sort: $scope.getReactively('sort')
    })
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.position.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.position.reset()
