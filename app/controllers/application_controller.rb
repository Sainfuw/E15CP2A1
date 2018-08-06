class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
  def permit_changes?
    id = params[:id].to_i
    return if current_user.id == id || current_user.admin
    redirect_to root_path, alert: 'You cant edit this History!'
  end
  def admin?
    return if current_user.try(:admin)
    redirect_to root_path, alert: 'Access only for Admins!'
  end
end
