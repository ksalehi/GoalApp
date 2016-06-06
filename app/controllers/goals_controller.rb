class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to user_url(@goal.user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to user_url(@goal.user)
    else
      flash.new[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    user = @goal.user
    @goal.destroy!
    redirect_to user_url(user)
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @goals = Goal.all
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :completed, :private)
  end
end
