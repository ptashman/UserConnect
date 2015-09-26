module ApplicationHelper
  def site?
    site_pages = [["posts", "index"], ["posts", "edit"], ["sites", "welcome"]]
    current_page = [params[:controller], params[:action]]
    site_pages.include?(current_page)
  end
end
