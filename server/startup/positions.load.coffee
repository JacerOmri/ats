Meteor.startup ->
  if Positions.find().count() == 0
    positions = [
      {
        'name': 'position 1'
      }
      {
        'name': 'position 2'
      }
    ]
    positions.forEach (position) ->
      Positions.insert position