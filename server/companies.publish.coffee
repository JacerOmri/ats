'use strict'

Meteor.publish 'companies', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfCompanies', Companies.find(where), noReady: true
  Companies.find where, options