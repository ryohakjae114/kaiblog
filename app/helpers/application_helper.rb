module ApplicationHelper
  def title(title_text)
    content_tag(:h1, title_text, class: 'mb-5')
  end
end
