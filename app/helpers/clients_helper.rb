module ClientsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = (column == sort_column) && (sort_direction == 'asc') ? 'desc' : 'asc'
    link_to title, params.merge({ sort: column, direction: direction, page: nil }), class: css_class
  end

  def sort_column
    Client.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] :  'asc'
  end
  
  def date_scope
    %w(past future load).include?(params[:datescope]) ? params[:datescope] : 'load'
  end
end
