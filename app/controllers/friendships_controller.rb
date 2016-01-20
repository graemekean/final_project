class FriendshipsController < ApplicationController
  before_fileter :authenticate_user!, only: [:new]


  def new

    if params[:friend_id]
      @friend = User.where(profile_name: params[:friend_id]).first
      @friendship = current_user.friendships.new(friend: @friend)
    else
      falsh[:error] = "A friend is required to form a friendship"
      redirect_to(profiles_show_path)
    end

  end

  private

   def params
    params.require(:friendship).permit(:user_id, :friend_id)
  end




end
