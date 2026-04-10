class UsersController < ApplicationController

  def new
    @user = User.invite!(user_params, current_user) do |u|
      u.company = Company.find(params[:user][:company_id])
    end
    redirect_to company_path(params[:company_id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :role)
  end
end
