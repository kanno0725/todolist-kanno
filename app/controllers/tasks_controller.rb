class TasksController < ApplicationController
  #認証済みの場合表示する
  before_action :authenticate_user!
  
  def index
    @tasks = current_user.tasks
  end
  
  def indexcompleted
    @tasks = current_user.tasks
  end

  def show
    @task = target_task params[:id]
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.new task_params
    @task.save!
    redirect_to user_tasks_path
  end

  def edit
    @task = target_task params[:id]
  end
  
  def update
    @task = target_task params[:id]
    @task.update!(task_params)
    redirect_to user_tasks_path
  end
  
  def destroy
    @task = target_task params[:id]
    @task.destroy!
    redirect_to user_tasks_path
  end
  
  def done
    @task = target_task params[:id]
    @task.update!(completed: true)
    @task.update!(completed_at: @task.updated_at)
    redirect_to user_tasks_path
  end
  
  private
    def target_task task_id
      current_user.tasks.where(id: task_id).take
    end
    
    def task_params
      params.permit(:title,:description,:target_at)
      # params.require(:task).permit(:title, :description)
    end
end
