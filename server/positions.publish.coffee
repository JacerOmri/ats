'use strict'

Meteor.publish 'positions', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Counts.publish this, 'numberOfPositions', Positions.find(where), noReady: true
  Positions.find where, options