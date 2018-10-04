class PokemonSkillsController < ApplicationController

  def create
  @pokemonskill = ::PokemonSkill.new(pokemonskill_params)
  @pokemon = ::Pokemon.find(params[:pokemon_id])
  pokemonpp = Skill.find(params[:pokemon_skill][:skill_id])

  @pokemonskill.pokemon_id = @pokemon.id
  @pokemonskill.current_pp = pokemonpp.max_pp
   if @pokemonskill.save
    flash[:success] = "Attack added!"
    redirect_to pokemon_path(@pokemon)
    else
    flash[:danger] = "Error Input attack!"
    redirect_to pokemon_path(@pokemon)
    end
  end

  def destroy
    @pokemon = ::Pokemon.find(params[:pokemon_id])
    @pokemonskill = ::PokemonSkill.find(params[:id])
    @pokemonskill.destroy
    redirect_to pokemon_path(@pokemon)
  end

  private
  def pokemonskill_params
    params.require(:pokemon_skill).permit(:skill_id )
  end

end