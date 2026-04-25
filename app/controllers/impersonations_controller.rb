class ImpersonationsController < ApplicationController
  def create
    authorize :impersonation, :create?
    target = User.find(params[:user_id])
    session[:admin_id] ||= current_user.id
    sign_in(target)
    redirect_to root_path, notice: "Now signed in as #{target.email}."
  end

  def destroy
    admin_id = session.delete(:admin_id)
    return redirect_to(root_path, alert: "Not impersonating.") unless admin_id
    sign_in(User.find(admin_id))
    redirect_to root_path, notice: "Back to your admin account."
  end
end
