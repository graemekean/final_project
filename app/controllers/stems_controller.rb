class StemsController < ApplicationController
  def index
    @stems = current_user.stems.all
    @projects = current_user.projects.all
      # @photo = current_user.photos.find(params[:id])




    end

    def show

      @stem = Stem.all.find(params[:id])
      @stems = current_user.stems.all
      @projects = current_user.projects.all

    end

    def new


      @stem = Stem.new
 
      @stems = current_user.stems.all

    # @comments = Comment.all

    
  end

  def create
    @user = current_user

    @stem = Stem.new(stem_params)
      # @stem.save

      # if @stem.save
      #       # to handle multiple images upload on create
      #       if params[:images]
      #         params[:images].each { |image|
      #         @user.photos.create(photo_image: image)
      #         }
      #       end
      #       flash[:notice] = "Your photos have been uploaded."
      #       redirect_to photos_path
      #     else 
      #       flash[:alert] = "Something went wrong."
      #       render :new
      # end

      # if request.post?
      #   @recipe = Recipe.new(params[:recipe])
      #   @recipe.save
      # else
      #   Recipe.create(recipe_params)   #see the team_params from the private method below
      #   redirect_to(recipes_path)
      # end
      params[:user_id] = current_user.id

      # current_user.photos.create(photo_params)   #see the team_params from the private method below
      # redirect_to(photos_path)

    end


    def destroy
      stem = current_user.stems.find(params[:id])  #doesn't need @ since it is not exposed - only being deleted
      # @album = current_user.albums.find(params[:id])

      stem.destroy
      redirect_to(projects_path)
    end

    def edit
      # params[:user_id] = current_user.id

      @stem = Stem.all.find(params[:id])


      # @photo = current_user.photos.find(params[:id])
      @projects = current_user.projects.all

      # @comments = @photo.comments.all
    # if @recipe
    #   if request.post?
    #     raise
    #     if @recipe.update_attributes(recipe)
    #       flash.now[:message]="Update successful"
    #     end
    #   end
    # else
    #   flash[:message]="page cannot be shown"
    # end
  end



  def update

      # params[:user_id] = current_user.id

      @stem = Stem.all.find(params[:id])
      @user = @stem.user


      # photo = current_user.photos.find(params[:id]) #again - the data does not need to be exposed - no @
      @stem.update(stem_params) 
      #from the private method below - whitelist check
      # redirect_to(recipes_path)
      redirect_to(projects_path)




    end  

    def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end

    private

    def stem_params
    # allows these params to be accessed by the methods above
    params.require(:stem).permit(:user_id, :project_id, :description, :key, :bpm)


    # params.require(:photo).permit(:album_id, :favourite, :date_uploaded, :rating, :photo_image, :title, :caption, :user_id, images:[])

     # ingredient_ids:[])
    end




end


