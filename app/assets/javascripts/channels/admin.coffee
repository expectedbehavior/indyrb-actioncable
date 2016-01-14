App.admin = App.cable.subscriptions.create "AdminChannel",
  received: (data) ->
    unless window.location.href.match(/admin/)
      window.location.href = "/sessions/logout"
