class PagesController < ResourceController::Base

  def show
  begin
    @page = Page.find_by_name(params[:id])  # GET/pages/name
    @page ||= Page.find(params[:id])
  rescue
    redirect_to "/404.html"
  else
     
  end
end
end
