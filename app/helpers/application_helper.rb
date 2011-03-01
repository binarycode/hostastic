module ApplicationHelper
  def title(page_title)
    content_for(:title) { h page_title }
    content_tag :h1, page_title
  end

  def fancy_name(object)
    "#{object.name} (#{object.email})"
  end
end
