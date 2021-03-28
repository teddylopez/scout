module ScoutingReportsHelper

  def full_name(player)
    return if (player.first_name.nil? or player.last_name.nil?)
    return "#{player.first_name} #{player.last_name}"
  end

  def age(dob)
    dob = Date.strptime(dob, "%m/%d/%y")
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def report_type(type)
    return SCOUTING_REPORT_TYPES[type.to_i]
  end

  def date_str(string)
    return string.strftime("%m/%d/%y")
  end

  def color_code_grade(grade)
    return if grade.nil?

    case grade
      when 70..80
        "btn-sm btn-danger"
      when 50..60
        "btn-sm btn-warning"
      when 20..40
        "btn-sm btn-success"
    end
  end

end
