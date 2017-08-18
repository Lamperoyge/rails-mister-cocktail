class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save

    if @cocktail && @dose
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def dose_params
    params.require(:cocktail).permit(doses_attributes: [:description, :ingredient_id])[:doses_attributes]["0"]
  end
end
