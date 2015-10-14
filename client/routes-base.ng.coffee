'use strict'

angular.module 'atsApp'

.config ($urlRouterProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $urlRouterProvider.otherwise '/'

.run ($rootScope, $state) ->
  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    switch error
      when 'AUTH_REQUIRED', 'FORBIDDEN', 'UNAUTHORIZED'
        $state.go 'main'
