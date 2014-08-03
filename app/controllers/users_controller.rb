 class UsersController < ApplicationController
   before_action :authenticate_user!
   
   def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
   if current_user.update_attributes(user_params)
     flash[:notice] = "User information updated"
     redirect_to edit_user_registration_path
   else
     render "devise/registrations/edit"
   end
 end

 def role?(base_role)
   role == base_role.to_s
 end
 
 private
 
 def user_params
  params.require(:user).permit(:name, :avatar)
end
end