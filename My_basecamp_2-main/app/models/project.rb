class Project < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy
  has_many :filers, dependent: :destroy
  has_many :messages, dependent: :destroy
end
