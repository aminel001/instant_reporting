class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new]
  def new
  end

end
