@Positions = new Mongo.Collection('positions')

Positions.allow
  insert: (userId, position) ->
    userId
  update: (userId, position, fields, modifier) ->
    userId
  remove: (userId, position) ->
    userId
