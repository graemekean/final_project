class StudiosController < ApplicationController
def index
  @user = current_user
  @studio = @user.studio

  
end


  def show

    @user = current_user
    @studio = @user.studio

  # if current_user.studios[0]
  #     @user = current_user
  #     @studio = @user.studios.last
  #     @projects = @studio.projects.all
  #   else
  #     redirect_to(new_studio_path)
  #   end
      

   

  end

  def new

    @studio = Studio.new

  end

  def create

    @user = current_user

    @studio = @user.studio.new(studio_params)
    
    params[:user_id] = current_user.id
     # current_user.albums.create(album_params)
    # redirect_to(albums_path)
  end

  private

  def studio_params
    # allows these params to be accessed by the methods above
    params.require(:studio).permit(:user_id, :status)
  end


end
