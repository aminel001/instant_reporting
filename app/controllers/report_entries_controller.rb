class ReportEntriesController < ApplicationController

  def index
  end

  def create
    @report = Report.find(params[:report_id])
    @report_entry = ReportEntry.new(report_entry_params)
    @report_entry.report_id = @report.id
    @report_entry.save
  end

  private

  def report_entry_params
    params.require(:report_entry).permit(:label, :value_text, :value_json)
  end
end
