class Food < ActiveRecord::Base
  belongs_to :user
  has_many :inventory_foods
  has_many :recipe_foods, dependent: :destroy

  validates :measurement_unit, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
