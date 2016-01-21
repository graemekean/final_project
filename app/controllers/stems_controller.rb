class StemsController < ApplicationController
 def new
  @stem = Stem.new


end

def edit
end

def show
end

def update
  respond_to do |format|
    if @stems.update(stem_params)
      format.html { redirect_to @status, notice: 'Status was successfully updated.' }
      format.json { render :show, status: :ok, location: @status }
    else
      format.html { render :edit }
      format.json { render json: @status.errors, status: :unprocessable_entity }
    end
  end
end



private

 def stem_params
  params.require(:stem).permit(:user_id, :id)
end

def params
  params.require(:project).permit(:id)
end





end
