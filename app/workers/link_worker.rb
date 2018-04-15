class LinkWorker
  include Sidekiq::Worker
  def perform(args)
  	link = Link.find(args['link_id'])
    logger.info "Link #{link.id} was clicked by #{args['remote_ip']} with #{args['user_agent']}"
  end
end