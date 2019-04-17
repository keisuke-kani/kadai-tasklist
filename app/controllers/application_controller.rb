class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to rogin_url
    end
  end
  
  def require_user_task_match
    unless session[:user_id] == @task.user_id
      redirect_to root_url
    end
  end
  
  
  def counts(user)
    @count_tasks = user.tasks.count
  end
  
end
