class ScoutingReport < ApplicationRecord
  belongs_to :player

  store_accessor :details, [:pitcher_role, :summary, :position, :time_to_first, :fastball_min_velo, :fastball_max_velo, :sinker_min_velo, :sinker_max_velo, :slider_min_velo, :slider_max_velo, :curveball_min_velo, :curveball_max_velo, :changeup_min_velo, :changeup_max_velo, :other_name, :other_min_velo, :other_max_velo]

  scope :pitcher_reports, -> { where("report_type = 0") }
  scope :position_reports, -> { where("report_type = 1") }

  def is_pitcher_report?
    self.report_type == 0
  end

  def is_position_report?
    self.report_type == 1
  end
end
