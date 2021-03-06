class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @user = current_user

    @projects = Project.all

     if params[:search]
       @projects = Project.search(params[:search]).order("created_at DESC")
     else
       @project = Project.all  #.order('created_at DESC')
     end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @pins }
        # format.js
      end

  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @user = current_user
    @project = Project.new
    # @studio = @user.studio
    @user.projects << @project

  end

  # GET /sessions/1/edit
  def edit
    @user = current_user
    @studio = current_user.studio
    @studio.projects << @project
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json

def add

end



  def update


    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to studio_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :bpm, :key, :creator, :genre, :public, :editable, :description, :created_at, :published, :published_at, :preview_url, :user_id, :search)
    end
end
