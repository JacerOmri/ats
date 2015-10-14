'use strict'

angular.module 'atsApp'
.controller 'CompanyDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.company = $scope.$meteorObject Companies, $stateParams.companyId, false
  $scope.$meteorSubscribe('companies')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.company.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
          $state.go 'companies-list'
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.company.reset()
