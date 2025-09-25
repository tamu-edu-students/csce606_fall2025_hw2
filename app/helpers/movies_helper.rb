module MoviesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    current_sort = session[:sort]
    current_direction = session[:direction]

    # flip direction if clicking same column
    direction = (column == current_sort && current_direction == "asc") ? "desc" : "asc"

    # add an arrow indicator if this column is currently sorted
    arrow = ""
    if column == current_sort
      arrow = current_direction == "asc" ? " ▲" : " ▼"
    end

    link_to "#{title}#{arrow}".html_safe, movies_path(sort: column, direction: direction)
  end

  def header_class(column)
    current_sort = session[:sort]
    current_direction = session[:direction]

    return "" unless column == current_sort

    current_direction == "asc" ? "sorted-asc" : "sorted-desc"
  end
end
