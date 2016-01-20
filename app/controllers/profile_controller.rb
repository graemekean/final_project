class ProfileController < ApplicationController


 before_action :set_profile, only: [:edit, :update, :destroy]

 # GET /statuses
 # GET /statuses.json
 def index

   @user = current_user
   @profiles = Profile.all


 end

 def show
   @user = current_user
   @profile = @user.profile
  
   if @user
     @statuses = @user.statuses.all
     render action: :show
   else
     render file: 'public/404', status: 404, formats: [:html]
   end
 end

 # GET /statuses/1
 # GET /statuses/1.json

 # GET /statuses/new
 def new
  @profile = Profile.new

  @user = current_user

  @user.profile = @profile


 end

 def edit
  @profile = Profile.new(profile_params)
 end

 # POST /statuses
 # POST /statuses.json
 def create
   @profile = Profile.new(profile_params)

   @user = current_user

   @user.profile = @profile



   respond_to do |format|
     if profile.save
       format.html { redirect_to profile, notice: 'Profile was successfully created.' }
       format.json { render :show, profile: :created, location: profile }
     else
       format.html { render :new }
       format.json { render json: status.errors, status: :unprocessable_entity }
     end
   end
 end

 # PATCH/PUT /statuses/1
 # PATCH/PUT /statuses/1.json
 def update
   respond_to do |format|
     if @profile.update(profile_params)
       format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
       format.json { render :show, status: :ok, location: @profile }
     else
       format.html { render :edit }
       format.json { render json: @profile.errors, status: :unprocessable_entity }
     end
   end
 end

 # DELETE /statuses/1
 # DELETE /statuses/1.json
 def destroy
   @status.destroy
   respond_to do |format|
     format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 private
   # Use callbacks to share common setup or constraints between actions.
   def set_profile
     @user = current_user
     @profile = @user.profile
   end

   # def user_params
   #   params.require(:user).permit(:id)
   # end

   def profile_params
    params.require(:user).permit(:user_id, :id, :name, :email, :password, :first_name, :last_name, :profile_name,
      :password_confirmation, :youtube_url, :linkedin_url, :role, :profile_image, :profile_video, :about_me, :primary_skill, :twitter_feed, :soundcloud_url)
    end


end
