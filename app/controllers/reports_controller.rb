class ReportsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new]
  def new
    @report = Report.new
    @report_template = ReportTemplate.find(params[:report_template_id])
  end

  def create
    @report = Report.new(report_params)
    @report.status = "Initiated"
    @report.report_version_number = 0
    @report.user = current_user
    @report.report_template = ReportTemplate.find(params[:report_template_id])
    if @report.save
      redirect_to report_path(@report)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
    @report_entry = ReportEntry.new
  end

def analyze
  @report = Report.find(params[:id])

  return head :forbidden unless current_user.admin? ||
                                @report.user_id == current_user.id ||
                                @report.user.company_id == current_user.company_id

  @result = ReportAnalyzer.new(@report).call
  render partial: "ai_analysis", locals: { result: @result }
rescue => e
  render partial: "ai_analysis_error", locals: { message: e.message }, status: :bad_gateway
end


  private

  def report_params
    params.require(:report).permit(:title)
  end

end
