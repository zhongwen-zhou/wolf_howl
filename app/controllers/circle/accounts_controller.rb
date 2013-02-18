class Circle::AccountsController < Circle::ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    # @activity = Activity.find(params[:activity_id]) if params.has_key?(:activity_id)
    # @activities = @current_user.activities
    # @account = Account.new

    
    @account = Account.new
    @group = Group.find(params[:group_id]) if params.has_key?(:group_id)
    @budgets = @group.budgets
    @activity = Activity.find(params[:activity_id]) if params.has_key?(:activity_id)
    @activities = @group.activities
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
      @group = Group.find(params[:group_id]) if params.has_key?(:group_id)
      @activity = Activity.find(params[:activity_id]) if params.has_key?(:activity_id)
      @account = @current_user.create_account(params[:account], @activity, @group)
    respond_to do |format|
      if @account.valid?
        format.html { redirect_to circle_group_path(@group), notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end
