module ApplicationHelper
  def adjust_status status
    statuses = {'on time' => 'A Tiempo', 'delayed' => 'Tardío'}
    return statuses[status]
  end

  def badge_color status
    if status.nil?
      return 'secondary'
    end
    colors = {'on time' => 'success', 'delayed' => 'warning'}
    return colors[status]
  end
end
