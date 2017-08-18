class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  accepts_nested_attributes_for :doses
  mount_uploader :photo, PhotoUploader
end
