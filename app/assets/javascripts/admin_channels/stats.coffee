App.stats = App.cable.subscriptions.create "StatsChannel",
  received: (data) ->
    if window.dps
      window.dps.event[window.dps.event.length - 1]["y"] += 1;
      window.dps[data.kind][window.dps[data.kind].length - 1]["y"] += 1;
