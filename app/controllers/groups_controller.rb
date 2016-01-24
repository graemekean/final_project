class GroupsController < ApplicationController


  def create
    @group = Group.new(params[:group])
    @group.users << current_user

  #   if @group.save
  #   # ... etc
  # end
end

end