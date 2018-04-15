class LinksController < ApplicationController
  def show
    if params[:slug]
      link = Link.find_by(slug: params[:slug])
      if link
        LinkWorker.perform_async(link.id)
        redirect_to link.url
      else
        render_not_found        
      end
    else
      render_not_found
    end
  end
end
