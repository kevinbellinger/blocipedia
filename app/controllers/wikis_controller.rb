class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wikis = Wiki.find(params[:id])
  end

  def new
    @wikis = Wiki.new
  end

  def edit
     @wikis = Wiki.find(params[:id])
  end

   def update
     @wikis = Wiki.find(params[:id])
     if @wikis.update_attributes(params.require(:wiki).permit(:title, :body))
       flash[:notice] = "Wiki was updated."
       redirect_to @wikis
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

  def create
    @wikis = Wiki.new(params.require(:wiki).permit(:title, :body))
     if @wikis.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wikis
     else
       flash[:error] = "There was an error saving the Wiki. Please try again."
       render :new
     end


  end

end
