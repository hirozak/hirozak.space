module ApplicationHelper

  def full_title(page_title='')
    base_title = "hirozak"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def default_meta_tags
    {
      site: 'hirozak',
      title: 'hirozak',
      reverse: true,
      charset: 'utf-8',
      description: 'プログラミングやガジェットについてのテック系の話、音楽や映画、旅行など興味のあること全てを更新するブログ。',
      keywords: 'hirozak,iPhone,mac,rails,プログラミング,音楽,ガジェット,映画,旅行,趣味,写真',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
      ],
      og: {
        site_name: 'hirozak',
        title: 'hirozak',
        description: 'テック系、音楽などのサブカルチャー、旅行まで扱うブログ',
        type: 'website',
        url: request.original_url,
        image: image_url('top-header.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        title: 'hirozak',
        description: 'テック系、音楽などのサブカルチャー、旅行まで扱うブログ',
        image: image_url('top-header.jpg'),
      }
    }
  end

end
