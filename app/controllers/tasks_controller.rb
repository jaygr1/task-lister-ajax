class TasksController < ApplicationController 
  def index
    @tasks = Task.all
  end

  def create
    Task.create(task_params)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  private
    def task_params
      params.require(:task).permit(:description, :priority)
    end

end