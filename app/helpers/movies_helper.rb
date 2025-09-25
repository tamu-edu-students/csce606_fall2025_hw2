module MoviesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    current_sort = params[:sort]
    current_direction = params[:direction]

    direction = (column == current_sort && current_direction == "asc") ? "desc" : "asc"

    arrow = ""
    if column == current_sort
      arrow = current_direction == "asc" ? " ▲" : " ▼"
    end

    link_to "#{title}#{arrow}".html_safe, movies_path(sort: column, direction: direction)
  end


  def header_class(column)
    current_sort = params[:sort]
    current_direction = params[:direction]

    return "" unless column == current_sort

    current_direction == "asc" ? "sorted-asc" : "sorted-desc"
  end
end
