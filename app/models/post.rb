class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  acts_as_taggable

  validates :title, presence: true
  validates :category_id, presence: true
  validates :text, presence: true
end
