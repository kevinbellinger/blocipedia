class CollaboratorsController < ApplicationController
  respond_to :html, :js

  #commenting out as I nested collaborator under wikis and was specific on routes.
  #def new
   # @collaborators = Collaborator.new
  #end

  #  def index
  #  @collaborators = Collaborator.all
  #  end

  #def show
  #  @collaborator = Collaborator.find(params[:id])
  #end

    def create
      @wikis = current_user.wikis.build(params.require(:wiki).permit(:title, :body))
      @collaborator = @wiki.collaborators.build(params.require(:collaborator).permit(:user_id, :wiki_id))

      if @collaborator.save
        flash[:notice] = "Successfully added Collaborator"
      else
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

end