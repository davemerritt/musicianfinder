class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create,] 
  before_filter :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
    @users = User.tagged_with(params[:tag])
    elsif params[:query]
      search = PgSearch.multisearch(params[:query])
      @users = search.map(&:searchable)
    elsif current_user && current_user.nearbys.length >= 3
      @users = current_user.nearbys
    else
      @users = User.all
    end
  end

  # def index
  #    if params[:tag] 
  #       @users = User.page(params[:page]).per(9).tagged_with(params[:tag])
  #    else
  #       @users = User.page(params[:page]).per(9)
  #    end
  # end

  def show
    @user = User.find(params[:id])
    @recipient = User.find(params[:id])
      if current_user
        @reference = @user.target_references.build 
        @invitation = Invitation.new
        @invitation.recipient_id = @recipient.id
      end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        auto_login(@user)
        format.html { redirect_to(:users, notice: 'User was successfully created.') }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:comment, 
                                 :email, 
                                 :password, 
                                 :password_confirmation, 
                                 :first_name, 
                                 :last_name, 
                                 :city, 
                                 :postal_code, 
                                 :bio, 
                                 :instrument_list, 
                                 :genre_list, 
                                 :latitude, 
                                 :longitude,
                                 :looking_for,
                                 :personal_url,
                                 :avatar)
  end
end
