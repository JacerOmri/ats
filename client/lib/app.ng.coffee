angular.module 'atsApp', [
  'angular-meteor'
  'ui.router'
  'ngMaterial'
  'angularUtils.directives.dirPagination'
]

onReady = () ->
  angular.bootstrap document, ['atsApp']
  
if Meteor.isCordova
  angular.element(document).on 'deviceready', onReady
else
  angular.element(document).ready onReady