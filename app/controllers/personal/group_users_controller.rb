class Personal::GroupUsersController < Personal::ApplicationController
  before_filter :current_group
  # GET /group_users
  # GET /group_users.json
  def index
    @group_users = GroupUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_users }
    end
  end

  # GET /group_users/1
  # GET /group_users/1.json
  def show
    @group_user = GroupUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_user }
    end
  end

  # GET /group_users/new
  # GET /group_users/new.json
  def new
    @group = Group.new
    # @group_user = @current_user.join_group(@group)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_user }
    end
  end

  # GET /group_users/1/edit
  def edit
    @group_user = GroupUser.find(params[:id])
  end

  # POST /group_users
  # POST /group_users.json
  def create
    # @group_user = GroupUser.new(params[:group_user])
    @group_user = @current_user.join_group(@group)
    respond_to do |format|
      if @group_user
        format.html { redirect_to @group, notice: 'Group user was successfully created.' }
        format.json { render json: @group_user, status: :created, location: @group_user }
      else
        format.html { render action: "new" }
        format.json { render json: @group_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_users/1
  # PUT /group_users/1.json
  def update
    @group_user = GroupUser.find(params[:id])

    respond_to do |format|
      if @group_user.update_attributes(params[:group_user])
        format.html { redirect_to @group_user, notice: 'Group user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_users/1
  # DELETE /group_users/1.json
  def destroy
    @current_user.quit_group(@group)
    respond_to do |format|
      format.html { redirect_to groups_path }
      format.json { head :no_content }
    end
  end


  private
  def current_group
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.find(params[:id]) if params.has_key?(:id)
  end
end
