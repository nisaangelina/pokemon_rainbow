class PokedexesController < ApplicationController
  def index
    # @pokedexes = ::Pokedex.all
      @pokedexes = ::Pokedex.paginate(:page => params[:page], :per_page => 5)

  end

  def show
   @pokedexes = ::Pokedex.find(params[:id])
  end

  def new
    @pokedex = ::Pokedex.new
    @elements = ::Pokedex::ELEMENT
  end

  def create
    @pokedex = ::Pokedex.new(pokedex_params)
     if @pokedex.save
      flash[:success] = "Pokedex '#{@pokedex.name}' Added!"
      redirect_to pokedexes_path
    else
      render 'new'
    end
  end

  def edit
    @pokedex = ::Pokedex.find(params[:id])
  end

  def update
    @pokedex = ::Pokedex.find(params[:id])
    if @pokedex.update(pokedex_params)
      flash[:success] = "Pokedex '#{@pokedex.name}' Updated!"
      redirect_to pokedexes_path
    else
      render 'edit'
    end
  end

  def destroy
    @pokedex = ::Pokedex.find(params[:id])
    @pokedex.destroy
    redirect_to pokedexes_path
  end

 def pokedex_params
  params.require(:pokedex).permit(:name, :base_health_point, :base_attack, :base_defence, :base_speed, :element_type, :image_url)
 end
end
