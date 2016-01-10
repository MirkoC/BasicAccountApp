class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have successfully created account. Welcome email will be sent to you shortly!'
      @user.deliver_welcome_email!
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.json { respond_with_bip(@user) }
      else
        format.json { respond_with_bip(@user) }
      end
    end
  end

end
