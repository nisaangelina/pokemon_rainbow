class PokemonsController < ApplicationController
  def index
    @pokemons = ::Pokemon.paginate(:page => params[:page], :per_page => 5)
  end

  def show
   @pokemons = ::Pokemon.find(params[:id])
  end

  def new
    @pokemon = ::Pokemon.new
    @elements = ::Pokedex::ELEMENT
  end

  def create
    pokemonpokedex = Pokedex.find_by(id: params[:pokemon][:pokedex_id])
    # if pokemonopokedex = !nil
    @pokemon = ::Pokemon.new(pokemon_params)
    @pokemon.max_health_point = pokemonpokedex.base_health_point
    @pokemon.attack = pokemonpokedex.base_attack
    @pokemon.defence = pokemonpokedex.base_defence
    @pokemon.speed = pokemonpokedex.base_speed
    @pokemon.current_experience = 0
    @pokemon.level = 1
    @pokemon.current_health_point = pokemonpokedex.base_health_point
    # @pokemon.element_type = pokemonpokedex.element_type
     if @pokemon.save
      flash[:success] = "Pokemon '#{@pokemon.name}' Added!"
      redirect_to pokemons_path
    else
      render 'new'
    end
  end

  def edit
    @pokemon = ::Pokemon.find(params[:id])
  end

  def update
    @pokemon = ::Pokemon.find(params[:id])
    if @pokemon.update(pokemonedit_params)
      flash[:success] = "Pokemon '#{@pokemon.name}' Updated!"
      redirect_to pokemons_path
    else
      render 'edit'
    end
  end

  def destroy
    @pokemon = ::Pokemon.find(params[:id])
    @pokemon.destroy
    redirect_to pokemons_path
  end

  def pokemon_params
  params.require(:pokemon).permit(:name, :pokedex_id)
 end

 def pokemonedit_params
  params.require(:pokemon).permit(:name, :attack, :speed, :defence, :current_health_point, )
 end
end
