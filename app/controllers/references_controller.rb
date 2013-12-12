class ReferencesController < ApplicationController
  before_filter :load_user
  
  def show
  	@user = Reference.find(params[:id])
  end

  def create
  	@reference = @user.target_references.build(reference_params)
  	@reference.source = current_user
  
    respond_to do |format|
    	if @reference.save
        format.html {redirect_to @user, notice: 'Reference Posted'}
    	else
    		format.html { redirect_to @user, alert: "Error in reference, try again!"}
         #render template: "users/show > Cant find partials
        format.json { render json: @reference.errors, 
          status: :unprocessable_entity}
    	end
    end
  end

  def destroy
  	@reference = Reference.find(params[:id])
  	@reference.destroy
  end

  private
  def reference_params
  	params.require(:reference).permit(:comment, :source_id, :target_id, :feedback_value, :jammed, :performed, :recorded)
  end
def
   load_user
  	@user = User.find(params[:user_id])
  end
end