class StemsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    # @stem = Stem.find(params[:id])
    # @project = @stem.project

    @stems = Stem.all

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @stem = Stem.find(stem_params[:id])
    @project = @stem.project

    @stems = Stem.all


  end

  # GET /posts/new
  def new
    @stem = Stem.new(stem_params[:id])
    


  end

  # GET /posts/1/edit
  def edit
    @stem = Stem.find(stem_params[:id])

  end

  # POST /posts
  # POST /posts.json
  def create
    @user = current_user
    @stem = Stem.new(stem_params)
    # @stem = Stem.find(params[:id])
    # @project = @stem.project
    # @project = Project.find(params[:id])


    # @project.stems << @stem

    # @stems = Stem.all
    # @project.stems << @stem



    respond_to do |format|
      if @stem.save
        format.html { redirect_to @stem, notice: 'Stem was successfully created.' }
        format.json { render :show, status: :created, location: @stem }
      else
        format.html { render :new }
        format.json { render json: @stem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @stem = Stem.find(params[:id])
    @stem.update(stem_params) #from the private method below - whitelist check

    redirect_to(stems_path)

    
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @stem.destroy
    respond_to do |format|
      format.html { redirect_to stems_url, notice: 'Stem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @stem = Stem.find(params[:id])
      @project = @stem.project
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stem_params
      params.permit(:description, :key, :bpm, :instrument, :projet_id, :id)
    end


   
     

   
end


