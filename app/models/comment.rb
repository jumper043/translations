class Comment < ApplicationRecord
  default_scope { order("created_at DESC") }
  belongs_to :post

  validates :name, presence: true, length: { minimum: 3 }
  validates :body, presence: true
end
