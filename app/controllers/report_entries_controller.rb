class ReportEntriesController < ApplicationController

  def index
  end

def create
  @report = Report.find(params[:report_id])

  @existing_report_entries = ReportEntry.where(report: @report)
  @existing_report_entries.destroy_all if @existing_report_entries.exists?

  params[:report_entries].each do |index, entry_params|
    entry = ReportEntry.new(report_entries_params(entry_params))
    entry.report = @report
    entry.save!
  end

  @report.report_version_number += 1
  @report.status = "Saved"
  @report.save!

  redirect_to @report, notice: 'All entries saved successfully'
end

  private

  def report_entries_params(entry_params)
    entry_params.permit(:label, :value_text, :value_json)
  end
end
