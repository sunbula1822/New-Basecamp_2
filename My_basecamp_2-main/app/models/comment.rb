class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user
  has_rich_text :body
end
