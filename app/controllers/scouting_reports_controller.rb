class ScoutingReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_scouting_report, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction
  helper_method :scouting_report_type

  def index
    initial_query = ScoutingReport.joins(:player)
                                  .order(sort_column + " " + sort_direction)
                                  .paginate(page: params[:page], per_page: STANDARD_PAGINATION_AMOUNT)
    if filter_pitch_reports?
      @scouting_reports = initial_query.pitcher_reports
    elsif filter_position_reports?
      @scouting_reports = initial_query.position_reports
    else
      @scouting_reports = initial_query
    end
  end

  def show
  end

  def new
    @scouting_report = @user.scouting_reports.build
  end

  def edit
    unless @scouting_report.user_id == @user.id
      redirect_to @scouting_report, notice: "You are not authorized to view that page."
    end
  end

  def create
    @scouting_report = @user.scouting_reports.build(scouting_report_params)

    respond_to do |format|
      if @scouting_report.save
        format.html { redirect_to @scouting_report, notice: "Scouting report was successfully created." }
      else
        format.html { render :edit, status: :unprocessable_entity }
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

    def set_user
      @user = current_user
    end

    def scouting_report_params
      params.require(:scouting_report).permit(:player_id, :user_id, :report_type, :grade, :status, :pitcher_role, :summary, :position, :time_to_first, :fastball_min_velo, :fastball_max_velo, :sinker_min_velo, :sinker_max_velo, :slider_min_velo, :slider_max_velo, :curveball_min_velo, :curveball_max_velo, :changeup_min_velo, :changeup_max_velo, :other_name, :other_min_velo, :other_max_velo)
    end

    def sort_column
      %w[updated_at, grade].include?(params[:sort]) ? params[:sort] : 'updated_at'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
    end

    def scouting_report_type
      if params[:report_type]
        return params[:report_type] == 'all' ? 'all' : params[:report_type].to_i
      elsif @scouting_report and @scouting_report.report_type
        return @scouting_report.report_type
      else
        return 'all'
      end
    end

    def filter_pitch_reports?
      scouting_report_type == 0
    end

    def filter_position_reports?
      scouting_report_type == 1
    end
end
