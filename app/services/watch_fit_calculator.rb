class WatchFitCalculator
  def initialize(user, watch)
    @user = user
    @watch = watch
  end

  def call
    physical_fit_score
  end

  private

  def estimated_wrist_width
    (@user.wrist_circumference * 10) / Math::PI
  end

  def lug_coverage
    (@watch.lug_to_lug / estimated_wrist_width) * 100
  end

  def lug_coverage_score
    case lug_coverage
    when ..75
      70
    when 76..79
      82
    when 80..83
      92
    when 84..88
      100
    when 89..92
      96
    when 93..95
      88
    when 96..98
      75
    when 99..100
      60
    else
      35
    end
  end

  def diameter_score
    target_diameter = @user.wrist_circumference * 2.3
    difference = (@watch.diameter - target_diameter).abs

    case difference
    when 0..1
      100
    when 1..2
      95
    when 2..3
      88
    when 3..4
      78
    when 4..5
      65
    when 5..6
      50
    else
      35
    end
  end

  def thickness_score
    ratio = (@watch.thickness / @watch.diameter) * 100

    case ratio
    when ..27
      100
    when 27..29
      95
    when 29..31
      90
    when 31..33
      82
    when 33..35
      72
    when 35..37
      60
    else
      45
    end
  end

  def proportion_score
  ratio = @watch.lug_to_lug / @watch.diameter

  case ratio
  when 1.15..1.20
    100
  when 1.20..1.23
    95
  when 1.23..1.26
    90
  when 1.26..1.29
    82
  when 1.29..1.32
    72
  else
    60
  end
end

  def physical_fit_score
    (
      lug_coverage_score * 0.45 +
      diameter_score * 0.30 +
      thickness_score * 0.15 +
      proportion_score * 0.10
    ).round
  end

    def size_preference_modifier
    case @user.size_preference
    when "compact"
      size_modifier(1.00, 0.98, 0.95, 0.90, 0.80)
    when "balanced"
      size_modifier(1.00, 0.98, 0.94, 0.88, 0.78)
    when "bold"
      size_modifier(1.00, 1.00, 0.98, 0.92, 0.80)
    else
      1.00
    end
  end

    def size_modifier(excellent, good, fair, low, poor)
    case physical_fit_score
    when 90..100
      excellent
    when 80..89
      good
    when 70..79
      fair
    when 60..69
      low
    else
      poor
    end
  end

    def size_preference_score
    (physical_fit_score * size_preference_modifier).round
  end
end
