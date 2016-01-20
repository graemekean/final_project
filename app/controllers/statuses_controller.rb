class StatusesController < ApplicationController
  before_action :set_status, only: [:edit, :update, :destroy]

  # GET /statuses
  # GET /statuses.json
  def index

    if current_user

      @user = current_user
      @statuses = @user.statuses.all

    else
      redirect_to(new_user_registration_path)
    end

  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show

    # @user = current_user
    # @statuses = user.statuses.all
    @status = Status.find(params[:id])
    @user = @status.user



  end

  # GET /statuses/new
  def new
    @status = Status.new

  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    status = Status.new(status_params)
    user = current_user

    user.statuses << status



    respond_to do |format|
      if status.save
        format.html { redirect_to status, notice: 'Status was successfully created.' }
        format.json { render :show, status: :created, location: status }
      else
        format.html { render :new }
        format.json { render json: status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @status }
      else
        format.html { render :edit }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      user = current_user
      @status = user.statuses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
     params.require(:status).permit(:email, :content, :created_at, :user_id, :id)
   end

   def user_params
    params.require(:user).permit(:id)

  end
end
