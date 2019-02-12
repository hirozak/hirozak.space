module Admin::PostsHelper
  def status(post)
    if post.Published?
      button_tag(post.published, class: 'btn btn-primary')
    elsif post.Draft?
      button_tag(post.published, class: 'btn btn-secondary')
    end
  end

  def md_to_html(text)
    options = {
      filter_html: false,
      hard_wrap: true,
      space_after_headers: true
    }

    extensions = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      space_after_headers: true,
      highlight: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def previous_post(post)
    link_to(previous_post.title, previous_post, class: 'previous_post') if previous_post == post
  end

  def next_post(post)
    if next_post == post
      link_to(next_post.title, next_post, class: 'next_post')
    else
      link_to(fa_icon('home lg') + ' トップ', root_path, class: 'next_post')
    end
  end
end
