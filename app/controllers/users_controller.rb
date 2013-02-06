#encoding: utf-8
class UsersController < ApplicationController
  layout 'personal'
  # layout false
  # skip_filter :current_user, :only => [:new, :create]
  skip_filter :authorize_login, :only => [:new, :create]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create_init(params[:user],request.remote_ip)
    respond_to do |format|
      unless @user.errors.size > 0
        session[:current_user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if params.has_key?(:current_password)
        if @user.password != params[:current_password]
          @user.errors.add(:password,'当前密码不正确！')
          return render action: "edit" 
        end
      else
        params[:user] = params[:user].merge({:password_confirmation => @user.password})
      end
      if @user.update_attributes(params[:user])
        return redirect_to root_path, notice: 'User was successfully created.'
      else
        return render action: "edit"
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
