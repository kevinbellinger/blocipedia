class WikisController < ApplicationController
  respond_to :html, :js

  def index
    # @wikis = current_user.wikis
    @wikis = Wiki.visible_to(current_user).paginate(page: params[:page], per_page: 10)
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
    #adding as collab was nested under wikis in routes. Not sure am right. 
    # @collaborators = Collaborator.new
  end

  def edit
  # @wikis = Wiki.friendly.find(params[:id])
   @wiki = Wiki.friendly.find(params[:id])
   authorize @wiki
    #adding as collab was nested under wikis in routes. Not sure am right. 
    #@collaborators = Collaborator.new
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
