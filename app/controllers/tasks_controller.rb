class TasksController < ApplicationController
  def index
  	@tasks = Task.all
  end

  def show
  	@task = Task.find(params[:id])
  end

  def new
  	@task = Task.new
  end

  def create
  	task = Task.new(task_params)
  	task.save!
  	redirect_to tasks_url, notice: "タスク「#{task.name}」を保存しました。"
  end

  def edit
  end

  private

  def task_params
  	params.require(:task).permit(:name, :description)
  end
end
