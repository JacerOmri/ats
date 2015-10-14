'use strict'

angular.module 'atsApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'positions-list',
    url: '/positions'
    templateUrl: 'client/positions/positions-list.view.html'
    controller: 'PositionsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'position-detail',
    url: '/positions/:positionId'
    templateUrl: 'client/positions/position-detail.view.html'
    controller: 'PositionDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
