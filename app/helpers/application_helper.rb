module ApplicationHelper
  def title(title_text)
    content_tag(:h1, title_text, class: 'fs-3 mb-3')
  end
end
