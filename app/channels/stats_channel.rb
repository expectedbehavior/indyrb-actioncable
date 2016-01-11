class StatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stats"
  end
end
