class CommentsController < ApplicationController
  before_filter :load_commentable
  

   def index
    # @commentable = Project.find(params[:project_id])
     @comments = @commentable.comments
   end

   def new
     @comment = @commentable.comments.new
   end

   def create

     @comment = @commentable.comments.new(comment_params)
     @comment.user_id = current_user.id
     if @comment.save
       redirect_to @commentable, notice: "Comment created."
     else
       render :new
     end
   end

 private

  def comment_params
   params.require(:comment).permit( :content, :created_at, :user_id, :id, :project_id, :status)
 end

   def load_commentable
     resource, id = request.path.split('/')[1, 2]
     @commentable = resource.singularize.classify.constantize.find(id)
   end
  

end
