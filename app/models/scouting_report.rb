class ScoutingReport < ApplicationRecord
  belongs_to :player

  store_accessor :details, [:pitcher_role, :summary, :position, :time_to_first, :fastball_min_velo, :fastball_max_velo, :sinker_min_velo, :sinker_max_velo, :slider_min_velo, :slider_max_velo, :curveball_min_velo, :curveball_max_velo, :changeup_min_velo, :changeup_max_velo, :other_name, :other_min_velo, :other_max_velo]
end
