class LinkWorker
  include Sidekiq::Worker
  def perform(link_id)
  	link = Link.find(link_id)
    logger.info "Link #{link.id} was clicked"
  end
end