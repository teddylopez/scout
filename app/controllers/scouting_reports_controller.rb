class ScoutingReportsController < ApplicationController
  before_action :set_scouting_report, only: %i[ show edit update destroy ]

  def index
    @scouting_reports = ScoutingReport.all
  end

  def show
  end

  def new
    @scouting_report = ScoutingReport.new
  end

  def edit
  end

  def create
    @scouting_report = ScoutingReport.new(scouting_report_params)

    respond_to do |format|
      if @scouting_report.save
        format.html { redirect_to @scouting_report, notice: "Scouting report was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @scouting_report.update(scouting_report_params)
        format.html { redirect_to @scouting_report, notice: "Scouting report was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @scouting_report.destroy
    respond_to do |format|
      format.html { redirect_to scouting_reports_url, notice: "Scouting report was successfully destroyed." }
    end
  end

  private
    def set_scouting_report
      @scouting_report = ScoutingReport.find(params[:id])
    end

    def scouting_report_params
      params.fetch(:scouting_report, {})
    end
end
