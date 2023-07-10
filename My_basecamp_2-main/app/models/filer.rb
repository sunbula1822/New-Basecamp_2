class Filer < ApplicationRecord
  belongs_to :project
  has_one_attached :attach
  validates :description , presence: true
end
