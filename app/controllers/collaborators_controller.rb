class CollaboratorsController < ApplicationController
  # respond_to :html, :js




  def index
    @collaborators = Collaborator.all
  end

  def new
   @collaborator = Collaborator.new 
   @collaborators = User.all
 end

 def update
     # @collaborator = Collaborators.new
   end

  #def show
  #  @collaborator = Collaborator.find(params[:id])
  #end

  def create
    @wiki = Wiki.friendly.find(params[:collaborator][:wiki_id])
     @collaborator = @wiki.collaborators.build(collaborator_params)   
    if @collaborator.save
      redirect_to :back 
      flash[:notice] = "Successfully added Collaborator"
    else
      redirect_to :back 
      flash[:error] = "Error adding collaborator. Try again"
    end  
  end

  def destroy
    @wikis = Wiki.find(params[:wiki_id])  
    @collaborator = @wiki.collaborators.find(params.require(:collaborator).permit(:user_id, :wiki_id))
    
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed."
    else
      flash[:error] = "Collaborator couldn't be removed. Please try again."
    end

    respond_with(@collaborator) do |f|
      f.html { redirect_to edit_wiki_path(@wiki) }
    end
  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:allowed, :user_id, :wiki_id)
  end

end