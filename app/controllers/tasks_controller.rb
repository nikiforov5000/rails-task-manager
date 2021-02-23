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
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      if @task.update_attributes(task_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @task
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to tasks_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to tasks_path
    end
  end
  
  

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
