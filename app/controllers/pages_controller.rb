class PagesController < ResourceController::Base

  def show
  begin
    unless params[:id] != 'home'
    @page = Page.find_by_name(params[:id])  # GET/pages/name
    @page ||= Page.find(params[:id])
    else
      @page = Page.find_by_name("home")
      # rescue
  #  redirect_to "/404.html"
  # else
     end
  end
  end
  def showhome
    @pageid = Page.find_by_name("home")
    show
  end
end
