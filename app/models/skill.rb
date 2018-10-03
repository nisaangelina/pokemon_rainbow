class Skill < ApplicationRecord
  extend Enumerize

  enumerize :element_type, in: ::Pokedex::ELEMENT
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :power, numericality: { greater_than: 0 }
  validates :max_pp, numericality: { greater_than: 0 }
  validates :element_type, inclusion: { in: ::Pokedex::ELEMENT }
end
