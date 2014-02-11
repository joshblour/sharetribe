class Admin::CategoriesController < ApplicationController
  
  before_filter :ensure_is_admin
  
  skip_filter :dashboard_only

  def index
    @selected_left_navi_link = "listing_categories"
    @categories = @current_community.top_level_categories.includes(:children)
  end
  
  def new
    @selected_left_navi_link = "listing_categories"
    @category = Category.new
    @default_transaction_types = @current_community.categories.last.transaction_types
  end

  def create
    @selected_left_navi_link = "listing_categories"
    @category = Category.new(params[:category])
    @category.community = @current_community
    @category.parent_id = nil if params[:category][:parent_id].blank?
    logger.info "Translations #{@category.translations.inspect}"
    if @category.save
      redirect_to admin_categories_path
    else
      flash[:error] = "Category saving failed"
      render :action => :new
    end
  end

  def edit
    @selected_left_navi_link = "listing_categories"
    @category = Category.find(params[:id])
    @default_transaction_types = @category.transaction_types
  end

  def update
    @selected_left_navi_link = "listing_categories"
    @category = Category.find(params[:id])
    @default_transaction_types = @category.transaction_types
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path
    else
      flash[:error] = "Category saving failed"
      render :action => :edit
    end
  end

  def order
    sort_priorities = params[:order].each_with_index.map do |category_id, index|
      [category_id, index]
    end.inject({}) do |hash, ids|
      category_id, sort_priority = ids
      hash.merge(category_id.to_i => sort_priority)
    end

    @current_community.categories.select do |category|
      sort_priorities.has_key?(category.id)
    end.each do |category|
      category.update_attributes(:sort_priority => sort_priorities[category.id])
    end

    render nothing: true, status: 200
  end

  # Remove form
  def remove
    @selected_left_navi_link = "listing_categories"
    @category = Category.find(params[:id])
    @new_category_candidates = @current_community.leaf_categories.reject { |category| @category.id == category.id }
  end

  # Remove action
  def destroy
    @category = Category.find_by_id_and_community_id(params[:id], @current_community.id)
    @category.destroy
    redirect_to admin_categories_path
  end

  def destroy_and_move
    @category = Category.find_by_id_and_community_id(params[:id], @current_community.id)
    new_category = Category.find_by_id_and_community_id(params[:new_category], @current_community.id)

    if new_category
      # Move listings
      @category.own_and_subcategory_listings.update_all(:category_id => new_category.id)

      # Move custom fields
      Admin::CategoryService.move_custom_fields!(@category, new_category)
    end

    @category.destroy

    redirect_to admin_categories_path
  end

end