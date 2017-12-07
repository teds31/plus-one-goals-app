class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.safe
      flash[:notice] = "New goal created!"
      redirect_to goals_path
    else
      flash[:alert] = "Goal not created"
      reder :new
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.save
      flash[:notice] = "Goal updated!"
      @goal.update(goal_params)
      redirect_to goals_path
    else
      flash[:alert] = "Goal not updated"
      render :edit
    end

    def show
      @goal = Goal.find(params[:id])
      @task = Task.where(goal_id = @goal)
    end
  end

  private

  def goal_params
    params.require(:goal).permit(
      :wish,
      :outcome,
      :obstacle
    )
  end

end
