class UserNotifier < ApplicationMailer
  default :from "admin@credit.me"

  def friend_requested(friendship_id)
    friendship = Friendship.find(friendship_id)
    @user = friendship.user
    @friend = friendship.friend

    mail to: @friend.email
    subject: "#{user.email} wants to be your friend"

  end

  def friend_request_accepted(friendship_id)
    friendship = Friendship.find(friendship_id)
    @user = friendship.user
    @friend = friendship.friend

    mail to: @user.email
    subject: "#{@friend.email} has accepted your friend request."

  end




end
