class Admin::StatsController < ApplicationController
  layout "admin"

  before_action :check_user_is_admin

  def index
    # render /app/views/admin/stats/index.html.erb
  end

  private

  def check_user_is_admin
    true # or whatever
  end
end
