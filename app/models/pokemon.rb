class Pokemon < ApplicationRecord
  belongs_to :pokedex
  has_many  :pokemon_skills
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :attack, presence: true, numericality: { :greater_than_or_equal_to => 0}, numericality: { greater_than: 0 }
  validates :defence, presence: true, numericality:{ :greater_than_or_equal_to => 0}, numericality: { greater_than: 0 }
  validates :speed, presence: true ,numericality: { :greater_than_or_equal_to => 0}, numericality: { greater_than: 0 }
  validates :current_health_point, presence: true, numericality: { :greater_than_or_equal_to => 0}
  validates :level, presence: true, numericality: { :greater_than_or_equal_to => 0}
   validates :max_health_point, presence: true, numericality: { :greater_than_or_equal_to => 0}

  def pokedex_image
    pokedex.image_url
  end
  def pokedex_element
    pokedex.element_type
  end
end
