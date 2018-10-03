class Pokemon < ApplicationRecord
  belongs_to :pokedex
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :attack, presence: true, numericality: { only_integer: true }
  validates :defence, presence: true, numericality: { only_integer: true }
  validates :speed, presence: true ,numericality: { only_integer: true }
  validates :current_health_point, presence: true, numericality: { only_integer: true }

  def pokedex_image
    pokedex.image_url
  end
  def pokedex_element
    pokedex.element_type
  end
end
