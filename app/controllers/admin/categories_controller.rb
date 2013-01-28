class Admin::CategoriesController < Admin::ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @top_categories = Category.top_categories
    @current_parent_category = params.has_key?(:top_category_id) ? Category.find(params[:top_category_id]) : @top_categories.first
    @categories = @current_parent_category.children#.page params[:page]
    # @categories = Category.all.page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    @top_categories = Category.top_categories
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    @top_categories = Category.top_categories
  end

  # POST /categories
  # POST /categories.json
  def create
    parent = Category.find(params[:category][:parent_id])
    @category = parent.create_child(@current_user,params[:category])
    # Rails.logger.info("===C:#{parent}")
    # params = params[:category].remove(:parent_id) if params[:category][:parent_id].blank?
    # if params
    #   # @category = 
    # else
    #   @category = Category.new(params[:category].merge!({:user_id => @current.user_id}))
    # end

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
