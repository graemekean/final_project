class RegistrationsController < Devise::RegistrationsController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params) #from the private method below - whitelist check

    redirect_to(users_path)

   end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to Session.Me!"
        redirect_to @user
      else
        render 'new'
      end
    end

    def edit
      @user = User.find(params[:id])

    end

    def destroy
      @user = User.find(params[:id])
       #doesn't need @ since it is not exposed - only being deleted
       @user.destroy
       redirect_to(users_path)
     end




  
  protected

   def user_params
    params.require(:user).permit(:name, :email, :password, :first_name, :last_name, :profile_name,
     :password_confirmation, :id, :youtube_url, :linkedin_url, :role, :profile_image, :profile_video, :about_me, :primary_skill, :twitter_feed, :soundcloud_url )
  end

  
  
end
