class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  acts_as_taggable

  validates :title, presence: true
  validates :category_id, presence: true
  validates :text, presence: true

  enum published: {Draft: false, Published: true}

  scope :default_order, -> { order("created_at desc") }
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }
  scope :favorite, -> { where(favorite: true) }

  def to_param
    slug
  end
end
