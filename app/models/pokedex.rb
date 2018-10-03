class Pokedex < ApplicationRecord
   validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
   validates :base_health_point, presence: true, length: { maximum: 5 }
   validates :base_attack, presence: true, length: { maximum: 5 }
   validates :base_defence, presence: true, length: { maximum: 5 }
   validates :base_speed, presence: true, length: { maximum: 5 }
   validates :element_type, presence: true, length: { maximum: 20 }
   validates :image_url, presence: true
end
