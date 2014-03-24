module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = (column == sort_column) && (sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge({ sort: column, direction: direction, page: nil }), class: css_class
  end

  def set_active
    val = case [action_name, params[:controller]]
          when %w(main clients)
            %w(active inactive inactive inactive)
          when %w(six_week_schedule todolist)
            %w(inactive active inactive inactive)
          when %w(new clients)
            %w(inactive inactive active inactive)
          when %w(commissions commissions)
            %w(inactive inactive inactive active)
          else
            %w(active inactive inactive inactive)
          end
    return val
  end
end
