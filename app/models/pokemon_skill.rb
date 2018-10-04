class PokemonSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :pokemon

  def getpower
    skill.power
  end

  def getname
    skill.name
  end

end
