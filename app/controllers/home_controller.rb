class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @random_goals = Goal.order("RANDOM()").first(8)
  end
end
