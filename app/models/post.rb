class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :photos, dependent: :destroy
  acts_as_taggable

  validates :title, presence: true
  validates :category_id, presence: true
  validates :text, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  enum published: {Draft: false, Published: true}

  scope :default_order, -> { order("created_at desc") }
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }
  scope :favorite, -> { where(favorite: true) }

  def to_param
    slug
  end

  def previous
    Post.published.default_order.where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Post.published.default_order.where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
end
