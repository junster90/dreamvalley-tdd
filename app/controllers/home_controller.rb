class HomeController < ApplicationController
  def index
    @random_goals = Goal.order("RANDOM()").first(8)
  end
end
