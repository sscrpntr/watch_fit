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

  def size_preference_score
    target_diameter = @user.wrist_circumference * 2.3
    difference = @watch.diameter - target_diameter

    case @user.size_preference
    when "compact"
      if difference <= 0
        100
      elsif difference <= 1
        95
      elsif difference <= 2
        85
      elsif difference <= 3
        70
      elsif difference <= 4
        55
      else
        40
      end
    when "balanced"
      absolute_difference = difference.abs

      if absolute_difference <= 1
        100
      elsif absolute_difference <= 2
        95
      elsif absolute_difference <= 3
        85
      elsif absolute_difference <= 4
        70
      elsif absolute_difference <= 5
        55
      else
        40
      end
    when "bold"
      if difference >= 0
        100
      elsif difference >= -1
        95
      elsif difference >= -2
        85
      elsif difference >= -3
        70
      elsif difference >= -4
        55
      else
        40
      end
    else
      100
    end
  end
end
