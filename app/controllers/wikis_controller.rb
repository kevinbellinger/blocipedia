class WikisController < ApplicationController
  respond_to :html, :js

  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wikis = Wiki.friendly.find(params[:id])
   if request.path != wiki_path(@wikis)
      redirect_to @wikis, status: :moved_permanently
    end
  end

  def new
    @wikis = Wiki.new
    authorize @wikis
  end

  def edit
     @wikis = Wiki.friendly.find(params[:id])
     authorize @wikis
  end

   def update
     @wikis = Wiki.friendly.find(params[:id])
     authorize @wikis
     if @wikis.update_attributes(params.require(:wiki).permit(:title, :body))
       flash[:notice] = "Wiki was updated."
       redirect_to @wikis
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

  def create
   # @wikis = Wiki.new(params.require(:wiki).permit(:title, :body))
    @wikis = current_user.wikis.build(params.require(:wiki).permit(:title, :body))
    authorize @wikis
     if @wikis.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wikis
     else
       flash[:error] = "There was an error saving the Wiki. Please try again."
       render :new
     end


  end

end
