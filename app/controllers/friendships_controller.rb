class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def new
    if params[:friend_id]
      @friend = User.where(profile_name: params[:friend_id]).first
      @friendship = current_user.friendships.new(friend: @friend)
    else
      flash[:error] = "A friend is required to form a friendship"
      redirect_to(profiles_show_path)
    end
  end

  def accept
    @friendship = current_user.friendships.find(params[:id])
    if @friendship.accept?
      flash[:success] = "You are now friends with #{friendship.friend.email}"
    else
      flash[:success] = "There was an error accepting the friend"
    end
    redirect_to friendships_path
  end

  def edit
    @friendship = current_user.friendships.find(params[:id])
    @friend = @friendship.friend
  end


  def index

    @users = User.all
    @friendships = current_user.friendships.all
  end

  # def create
  #     if params[:friendship] && params[:friendship].has_key?(:friend_id)
  #       raise
  #       @friend = User.where(profile_name: params[:friendship][:friend_id]).first
  #       @friendship = Friendship.request(current_user, @friend)
  #       respond_to do |format|
  #         if @friendship.new_record?
  #           format.html { flash[:error] = "There was a problem."; redirect_to profile_path(@friend) }
  #           format.json { render json: @friendship.to_json, status: :precondition_failed }
  #         else
  #           format.html { flash[:success] = "Friendship created."; redirect_to profile_path(@friend) }
  #           format.json { render json: @friendship.to_json }
  #         end
  #       end
  #     else
  #       flash[:error] = "Friend required"
  #       redirect_to root_path
  #     end
  #   end


    def create
        if params[:friend_id]
          @friend = User.find(params[:friend_id])
          @friendship = current_user.friendships.new(friend: @friend)
          if @friendship.save
            flash[:success] = "Friendship created."
          else
            flash[:error] = "There was a problem."
          end
          redirect_to profile_path(@friend)
        else
          flash[:error] = "Friend required"
          redirect_to root_path
        end
      end

  # def create
  #   @friendship = current_user.friendships.build(:friend_id => params[:friend_id], approved: "false")
  #   if @friendship.save
  #     flash[:notice] = "Friend requested."
  #     redirect_to :back
  #   else
  #     flash[:error] = "Unable to request friendship."
  #     redirect_to :back
  #   end
  # end

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
