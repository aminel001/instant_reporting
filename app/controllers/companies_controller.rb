class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.save
    redirect_to company_path(@company)
  end

  def edit
    @company = Company.find(params[:id])
    @user = User.new
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :logo)
  end
end
