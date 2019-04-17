class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:new , :show, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    if logged_in?
      @task = current_user.tasks.build
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page]).per(5)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクが追加されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'タスクが正常に追加されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクが編集されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが正常に編集されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'タスクは削除されました'
    redirect_to '/'
  end
  
  
  
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end
