module ApplicationHelper
  def set_active
    case [action_name, params[:controller]]
    when %w(index clients)
      %w(active inactive inactive inactive)
    when %w(show todolists)
      %w(inactive active inactive inactive)
    when %w(new clients)
      %w(inactive inactive active inactive)
    when %w(show commissions)
      %w(inactive inactive inactive active)
    else
      %w(active inactive inactive inactive)
    end
  end
end
