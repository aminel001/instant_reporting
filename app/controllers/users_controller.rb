class UsersController < ApplicationController
  after_action :verify_authorized

  def create
    @user = User.new(user_params)
    @user.company_id ||= current_user.company_id
    authorize @user, :create?

    @user = User.invite!(user_params.merge(company_id: @user.company_id), current_user)

    if @user.errors.any?
      puts @user.errors.full_messages.inspect
    end
    redirect_to company_path(@user.company)
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    authorize @user
    @user.save
    redirect_to(main_path)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :role, :company_id, :profile_photo)
  end
end
