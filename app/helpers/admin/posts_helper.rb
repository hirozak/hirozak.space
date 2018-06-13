module Admin::PostsHelper

  def status(post)
    if post.Published?
      button_tag(post.published, class:"btn btn-primary")
    elsif post.Draft?
      button_tag(post.published, class:"btn btn-secondary")
    end
  end
end
