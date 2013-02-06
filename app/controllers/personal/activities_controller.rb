class Personal::ActivitiesController < Personal::ApplicationController
  # GET /activities
  # GET /activities.json
  def index
    @activities = @current_user.activities.order('id desc').page(params[:page])
    @activity = @activities.first
    @activity.check_update_status if @activity.present?
    return render :show
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activities = @current_user.activities.order('id desc').page(params[:page])
    @activity = Activity.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new({:start_date => Time.now, :end_date => Time.now})
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = @current_user.activities.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = @current_user.create_activity(params[:activity])

    respond_to do |format|
      if @activity.errors.empty?
        format.html { redirect_to personal_user_activities_path(@current_user), notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to personal_user_activities_url(@current_user), notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to personal_user_activities_url(@current_user) }
      format.json { head :no_content }
    end
  end

end
