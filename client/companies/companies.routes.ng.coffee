'use strict'

angular.module 'atsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'companies-list',
    url: '/companies'
    templateUrl: 'client/companies/companies-list.view.html'
    controller: 'CompaniesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'company-detail',
    url: '/companies/:companyId'
    templateUrl: 'client/companies/company-detail.view.html'
    controller: 'CompanyDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
