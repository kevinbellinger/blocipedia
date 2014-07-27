class WikisController < ApplicationController
  def index
    @wikis = Wikis.all
  end

  def show
    @wikis = Wikis.find(params[:id])
  end

  def new
    @wikis = Wikis.new
  end

  def edit
  end

  def create
    @wikis = Wikis.new(params.require(:wikis).permit(:title, :body))
     if @wikis.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wikis
     else
       flash[:error] = "There was an error saving the Wiki. Please try again."
       render :new
     end


  end

end
