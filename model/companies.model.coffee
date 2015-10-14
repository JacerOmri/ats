@Companies = new Mongo.Collection('companies')

Companies.allow
  insert: (userId, company) ->
    userId
  update: (userId, company, fields, modifier) ->
    userId
  remove: (userId, company) ->
    userId
