module Admin
  class LinksController < ApplicationController
    before_action :set_link, only: [:edit, :update]

    def index
      @links = Link.all
    end

    def new
      @link = Link.new
    end

    def edit; end

    def create
      @link = Link.new(link_params)

      if @link.save
        redirect_to admin_links_path, notice: 'Link was successfully created.'
      else
        render :new
      end
    end

    def update
      if @link.update(link_params)
        redirect_to admin_links_path, notice: 'Link was successfully created.'
      else
        render :edit
      end
    end

    private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:url)
    end
  end
end
