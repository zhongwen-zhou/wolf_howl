class Personal::ActivityUsersController < Personal::ApplicationController
  # GET /activity_users
  # GET /activity_users.json
  def index
    @activity_users = ActivityUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_users }
    end
  end

  # GET /activity_users/1
  # GET /activity_users/1.json
  def show
    @activity_user = ActivityUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity_user }
    end
  end

  # GET /activity_users/new
  # GET /activity_users/new.json
  def new
    @activity_user = ActivityUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_user }
    end
  end

  # GET /activity_users/1/edit
  def edit
    @activity_user = ActivityUser.find(params[:id])
  end

  # POST /activity_users
  # POST /activity_users.json
  def create
    # group = Group.find(:group_id)
    activity = Activity.find(params[:activity_id])
    @activity_user = @current_user.join_activity(activity)
    # @activity_user = ActivityUser.new(params[:activity_user])

    respond_to do |format|
      if @activity_user.valid?
        format.html { redirect_to group_path, notice: 'Activity user was successfully created.' }
        format.json { render json: @activity_user, status: :created, location: @activity_user }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_users/1
  # PUT /activity_users/1.json
  def update
    @activity_user = ActivityUser.find(params[:id])

    respond_to do |format|
      if @activity_user.update_attributes(params[:activity_user])
        format.html { redirect_to @activity_user, notice: 'Activity user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_users/1
  # DELETE /activity_users/1.json
  def destroy
    @activity_user = ActivityUser.find(params[:id])
    @activity_user.destroy

    respond_to do |format|
      format.html { redirect_to activity_users_url }
      format.json { head :no_content }
    end
  end
end
