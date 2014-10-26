class InvitationsController < ApplicationController
  before_filter :load_user, except: [:read, :show]

  def index
    redirect_to root_url unless current_user == @user
    @invitations = Invitation.all
  end

  def show
	  @invitation = Invitation.find(params[:id])
	  @user = User.find(@invitation.recipient_id)
    redirect_to root_url unless current_user == @user
    @reply = Invitation.new
  end

  def new
	  @invitation = Invitation.new
  end

  def read
	  @user = current_user
	  @invitation = Invitation.find(params[:id])

    if current_user.id == @invitation.recipient_id
	   @invitation.toggle!(:recipient_read)
    else
     @invitation.toggle!(:sender_read)
    end

	  if @invitation.save
	    redirect_to user_invitations_path(@user)
	  else
	    redirect_to user_path(@user)
	  end
  end

  def create
	  @invitation = @user.invitations.build(invitation_params)
	  @invitation.user_id = current_user.id
    respond_to do |format|
    	if @invitation.save
  	    format.html {redirect_to user_path(@user), notice: 'Message Sent'}
        format.js{}
  	  else
  	    format.html { redirect_to user_path(@user), notice: 'Message can not be blank' }
        format.js{}
  	  end
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:content, :recipient_id, :user_id)
  end

  def correct_user

  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
