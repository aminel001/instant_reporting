class UsersController < ApplicationController

  def create
    @user = User.invite!(user_params, current_user) do |u|
      u.company = Company.find(params[:user][:company_id])
    end
    if @user.errors.any?
      puts @user.errors.full_messages.inspect
    end
    redirect_to company_path(@user.company)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :role, :company_id)
  end
end
