class Personal::GroupsController < Personal::ApplicationController
  before_filter :active_nav
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @group = Group.first

    @my_groups = @current_user.groups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = @current_user.create_group(params[:group])
    # @group = @current_user.groups.build(params[:group])
    # @group = Group.new(params[:group])

    respond_to do |format|
      if @group.valid?
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def set_admin
    user = User.find(params[:user_id])
    group = Group.find(params[:id])
    user.joined_group(group).update_attribute(:is_admin, true)
    return redirect_to groups_url
  end

  def canel_admin
    user = User.find(params[:user_id])
    group = Group.find(params[:id])
    user.joined_group(group).update_attribute(:is_admin, false)
    return redirect_to groups_url
  end
  private

  def active_nav
    @active_nav = 'group'
  end
end
