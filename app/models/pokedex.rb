class Pokedex < ApplicationRecord
  extend Enumerize

  ELEMENT = [ "Normal", "Fire", "Fighting", "Water", "Flying", "Grass", "Poison", "Electric", "Ground", "Psychic", "Rock", "Ice", "Bug", "Dragon", "Ghost", "Dark", "Steel", "Fairy" ]
  enumerize :element_type, in:ELEMENT

   validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
   validates :base_health_point, presence: true, length: { maximum: 5 }
   validates :base_attack, presence: true, length: { maximum: 5 }
   validates :base_defence, presence: true, length: { maximum: 5 }
   validates :base_speed, presence: true, length: { maximum: 5 }
   validates :element_type, presence: true, length: { maximum: 20 }
   validates :image_url, presence: true
   validates :element_type, inclusion: { in: ELEMENT }
end
