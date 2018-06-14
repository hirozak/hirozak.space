class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true

  def to_param
    name
  end

end
