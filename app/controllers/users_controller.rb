class UsersController < ApplicationController
  def index
  end

def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis.visible_to(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :last_4_digits, :subscription)
  end
end

end