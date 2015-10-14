'use strict'

angular.module 'atsApp'
.controller 'PositionsListCtrl', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.companies = $scope.$meteorCollection () ->
    Companies.find {}, {sort:$scope.getReactively('sort')}

  $scope.getCompanyNameById = (id) ->
    $scope.$meteorObject Companies, id, false

  $scope.positions = $scope.$meteorCollection () ->
    Positions.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('positions', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.positionsCount = $scope.$meteorObject Counts, 'numberOfPositions', false

    $scope.$meteorSubscribe('companies', {
      sort: $scope.getReactively('sort')
    })

  $meteor.session 'positionsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.positions.save $scope.newPosition
      $scope.newPosition = undefined
      
  $scope.remove = (position) ->
    $scope.positions.remove position
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
