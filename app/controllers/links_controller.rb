class LinksController < ApplicationController
  def show
    if params[:slug]
      @link = Link.where(slug: params[:slug]).first
      if @link
        redirect_to @link.url
      else
        render_not_found        
      end
    else
      render_not_found
    end
  end
end
