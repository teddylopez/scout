class ScoutingReport < ApplicationRecord
  belongs_to :player
  belongs_to :user

  validates :player, presence: true
  validates :position, presence: true, if: :is_position_report?
  validates :summary, presence: true
  validates :time_to_first, numericality: { only_integer: false }, unless: :is_pitcher_report?
  validates :grade, presence: true, numericality: { only_integer: true }

  with_options if: :is_pitcher_report? do |r|
    r.validates :fastball_max_velo, presence: true, numericality: { only_integer: false }, if: :fastball_min_velo?
    r.validates :fastball_min_velo, presence: true, numericality: { only_integer: false }, if: :fastball_max_velo?
    r.validates :sinker_max_velo, presence: true, numericality: { only_integer: false }, if: :sinker_min_velo?
    r.validates :sinker_min_velo, presence: true, numericality: { only_integer: false }, if: :sinker_max_velo?
    r.validates :slider_max_velo, presence: true, numericality: { only_integer: false }, if: :slider_min_velo?
    r.validates :slider_min_velo, presence: true, numericality: { only_integer: false }, if: :slider_max_velo?
    r.validates :curveball_max_velo, presence: true, numericality: { only_integer: false }, if: :curveball_min_velo?
    r.validates :curveball_min_velo, presence: true, numericality: { only_integer: false }, if: :curveball_max_velo?
    r.validates :changeup_max_velo, presence: true, numericality: { only_integer: false }, if: :changeup_min_velo?
    r.validates :changeup_min_velo, presence: true, numericality: { only_integer: false }, if: :changeup_max_velo?
    r.validates :other_min_velo, presence: true, numericality: { only_integer: false }, if: :other_max_velo?
    r.validates :other_min_velo, presence: true, numericality: { only_integer: false }, if: :other_name?
    r.validates :other_max_velo, presence: true, numericality: { only_integer: false }, if: :other_min_velo?
    r.validates :other_max_velo, presence: true, numericality: { only_integer: false }, if: :other_name?
    r.validates :other_name, presence: true, if: :other_min_velo?
    r.validates :other_name, presence: true, if: :other_max_velo?
  end

  store_accessor :details, [:pitcher_role, :summary, :position, :time_to_first, :fastball_min_velo, :fastball_max_velo, :sinker_min_velo, :sinker_max_velo, :slider_min_velo, :slider_max_velo, :curveball_min_velo, :curveball_max_velo, :changeup_min_velo, :changeup_max_velo, :other_name, :other_min_velo, :other_max_velo]

  scope :pitcher_reports, -> { where("report_type = 0") }
  scope :position_reports, -> { where("report_type = 1") }

  def is_pitcher_report?
    self.report_type == 0
  end

  def is_position_report?
    self.report_type == 1
  end

  def fastball_min_velo?
    fastball_min_velo.present?
  end

  def fastball_max_velo?
    fastball_max_velo.present?
  end

  def sinker_min_velo?
    sinker_min_velo.present?
  end

  def sinker_max_velo?
    sinker_max_velo.present?
  end

  def curveball_min_velo?
    curveball_min_velo.present?
  end

  def curveball_max_velo?
    curveball_max_velo.present?
  end

  def changeup_min_velo?
    changeup_min_velo.present?
  end

  def changeup_max_velo?
    changeup_max_velo.present?
  end

  def slider_min_velo?
    slider_min_velo.present?
  end

  def slider_max_velo?
    slider_max_velo.present?
  end

  def other_min_velo?
    other_min_velo.present?
  end

  def other_max_velo?
    other_max_velo.present?
  end

  def other_name?
    other_name.present?
  end
end
