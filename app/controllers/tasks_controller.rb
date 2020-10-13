class TasksController < ApplicationControllera
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
  	@tasks = current_user.tasks.recent
  end

  def show
    # current_user.tasks.find(params[:id])
  	# @task = Task.find(params[:id])
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = current_user.tasks.new(task_params)
  	if @task.save
  	  redirect_to @task, notice: "タスク「#{@task.name}」を保存しました。"
    else
      render :new
    end
  end

  def edit
    # current_user.tasks.find(params[:id])
  	# @task = Task.find(params[:id])
  end

  def update
    # current_user.tasks.find(params[:id])
  	# task = Task.find(params[:id])
  	task.update!(task_params)
  	redirect_to tasks_url, notice: "タスク 「#{@task.name}」を更新しました。"
  end

  def destroy
    # current_user.tasks.find(params[:id])
  	# task = Task.find(params[:id])
  	task.destroy
  	redirect_to tasks_url, notice: "タスク 「#{@task.name}」を削除しました。"
  end

  private

  def task_params
  	params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
