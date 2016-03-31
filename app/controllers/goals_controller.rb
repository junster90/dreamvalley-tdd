class GoalsController < ApplicationController
  def new
  end

  def create
    goal = Goal.new(goal_params)
    goal.user_id = current_user.id
    if goal.save
      flash[:success] = "Successfully added goal!"
      redirect_to root_path
    else
      flash[:error] = 'Problem saving new goal. :('
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:category, :description)
  end
end
