Meteor.startup ->
  if Companies.find().count() == 0
    companies = [
      {
        'name': 'company 1'
      }
      {
        'name': 'company 2'
      }
    ]
    companies.forEach (company) ->
      Companies.insert company