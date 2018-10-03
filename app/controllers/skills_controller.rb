class SkillsController < ApplicationController
  def index
    @skills = ::Skill.paginate(:page => params[:page], :per_page => 5)
  end

  def show
   @skills = ::Skill.find(params[:id])
  end

  def new
    @skill = ::Skill.new
    @elements = ::Pokedex::ELEMENT
  end

  def create
    @skill = ::Skill.new(skill_params)
     if @skill.save
      flash[:success] = "Skill '#{@skill.name}' Added!"
      redirect_to skills_path
    else
      render 'new'
    end
  end

  def edit
    @skill = ::Skill.find(params[:id])
  end

  def update
    @skill = ::Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:success] = "Skill '#{@skill.name}' Updated!"
      redirect_to skills_path
    else
      render 'edit'
    end
  end

  def destroy
    @skill = ::Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end

  def skill_params
  params.require(:skill).permit(:name, :power, :max_pp,:element_type)
 end
end
