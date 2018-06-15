module Admin::PostsHelper

  def status(post)
    if post.Published?
      button_tag(post.published, class:"btn btn-primary")
    elsif post.Draft?
      button_tag(post.published, class:"btn btn-secondary")
    end
  end

  def md_to_html(text)
    options = {
      filter_html:     false,
      hard_wrap:       true,
      space_after_headers: true,
    }

    extensions = {
      autolink:           true,
      no_intra_emphasis:  true,
      fenced_code_blocks: true,
      highlight:          true,
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
