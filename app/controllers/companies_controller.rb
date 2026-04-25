class CompaniesController < ApplicationController
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @companies = policy_scope(Company)
  end

  def show
    @company = Company.find(params[:id])
    authorize @company
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    @company.save
    redirect_to company_path(@company)
  end

  def edit
    @company = Company.find(params[:id])
    authorize @company
    @user = User.new
  end

  def update
    @company = Company.find(params[:id])
    authorize @company
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :logo)
  end
end
