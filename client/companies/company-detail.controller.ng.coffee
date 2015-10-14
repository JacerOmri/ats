'use strict'

angular.module 'atsApp'
.controller 'CompanyDetailCtrl', ($scope, $stateParams, $meteor) ->
  $scope.company = $scope.$meteorObject Companies, $stateParams.companyId
  $scope.$meteorSubscribe('companies')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.company.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.company.reset()
