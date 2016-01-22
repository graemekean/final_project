class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  def new

    if params[:friend_id]
      @friend = User.where(profile_name: params[:friend_id]).first
      @friendship = current_user.friendships.new(friend: @friend)
    else
      flash[:error] = "A friend is required to form a friendship"
      redirect_to(profiles_show_path)
    end

  end

  def index
    
    @users = User.all
    @friendships = current_user.friendships.all
  end

  def create
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id], approved: "false")
        if @friendship.save
          flash[:notice] = "Friend requested."
          redirect_to :back
        else
          flash[:error] = "Unable to request friendship."
          redirect_to :back
        end
  end

      # PATCH/PUT /friendships/1
      # PATCH/PUT /friendships/1.json
      def update
      @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
      @friendship.update(approved: true)
        if @friendship.save
          redirect_to root_url, :notice => "Successfully confirmed friend!"
        else
          redirect_to root_url, :notice => "Sorry! Could not confirm friend!"
        end
      end

      # DELETE /friendships/1
      # DELETE /friendships/1.json
      def destroy
        @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
        @friendship.destroy
        flash[:notice] = "Removed friendship."
        redirect_to :back
      end

  private

   def params
    params.require(:friendship).permit(:user_id, :friend_id, :state)
  end




end
