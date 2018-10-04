class PokemonSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :pokemon

  validates :current_pp, numericality: { less_than_or_equal_to: :max_pp }
  validates :skill_id, uniqueness: { scope: :pokemon }
  validate :validate_element_type

  def getpower
    skill.power
  end

  def getname
    skill.name
  end

  def max_pp
    skill.max_pp
  end

  def pokemon_element_type
    pokemon.pokedex_element
  end

  def skill_element_type
    skill.element_type
  end

private

  def validate_element_type
    if pokemon_element_type != skill_element_type
      errors.add(:element_type ,"Attack need to be the same element type")
    end
  end
end
