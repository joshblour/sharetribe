class SearchController < BaseController

  skip_filter :dashboard_only

  def show
    redirect_to root
  end

end
