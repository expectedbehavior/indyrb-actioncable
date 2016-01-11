#= require cable
#= require_self

@App = {}
App.cable = ActionCable.createConsumer()
