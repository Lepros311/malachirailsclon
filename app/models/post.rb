class Post < ApplicationRecord
    extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_rich_text :description
end
