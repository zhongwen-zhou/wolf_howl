#encoding: utf-8
class Personal::AccountsController < Personal::ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    if params[:top_menu_type] == 'io_type'
      @top_menu_type = 'io_type'
      unless params[:io_type] == 'in_come'
        @accounts = @current_user.accounts.outcome.page(params[:page])
        @io_type = 'out_come'
      else
        @accounts = @current_user.accounts.income.page(params[:page])
        @io_type = 'in_come'
      end
    elsif params[:top_menu_type] == 'category_type'
      @top_menu_type = 'category_type'
      @accounts = Account.page(params[:page])
    else
      @top_menu_type = 'all'
      @accounts = Account.page(params[:page])
    end
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
    @activity = Activity.find(params[:activity_id]) if params.has_key?(:activity_id)
    @account = Account.new

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
    # @account = Account.new(params[:account])
    if params.has_key?(:activity_id)
      activity = Activity.find(params[:activity_id]) if params.has_key?(:activity_id)
      @account = @current_user.create_account(params[:account], activity)
    else
      @account = @current_user.create_account(params[:account])
    end
    respond_to do |format|
      if @account.valid?
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
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

  def statistics
    if params.has_key?(:statistics_type)
      @paint_chart = true
      @h = LazyHighCharts::HighChart.new('graph') do |f|
        f.options[:chart][:defaultSeriesType] = "area"
        f.series(:name=>'收入', :data=>[500,60,700,70,80,9,900])
        f.series(:name=>'支出', :data=> [800,390,569,1000,500,269])
      end
    end
  end
end
