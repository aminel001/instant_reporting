class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about]

  def home
    @current_user = current_user if @user_signed_in
  end

  def about
  end
end
