class TasksController < ApplicationController
	skip_before_action :verify_authenticity_token

  before_action :set_task, only: [:show, :update, :destroy]

  def create
    task = Task.new(task_params)

    if task.save
      render json: {message: "Task created successfully", code: 200}
    else
      render json: {errors: task.errors.full_messages, code: 400 }
    end
  end

  def show
    render json: @task
  end

  def index
	  tasks = Task.page(params[:page]).per(10)
	  render json: tasks
	end

  def update
    if @task.update(task_params)
      render json: {message: "Task updated successfully", code: 200}
    else
      render json: {errors: @task.errors.full_messages, code: 400 }
    end
  end

  def destroy
    if @task.destroy
      render json: {message: "Task deleted successfully", code: 200}
    else
      render json: {errors: @task.errors.full_messages, code: 400 }
    end
  end

  private

  def set_task
		begin
    	@task = Task.find(params[:id])
  	rescue ActiveRecord::RecordNotFound
    	render json: { error: 'Task not found' }
    end
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
