class FriendshipsController < ApplicationController
  before_fileter :authenticate_user!, only: [:new]


  def new

    if params[:friend_id]
      @friend = User.find(params[:friend_id])
    else
      falsh[:error] = "A friend is required to form a friendship"
    end

  end




end
