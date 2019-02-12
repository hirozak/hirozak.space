class Category < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, presence: true

  def to_param
    name
  end
end
