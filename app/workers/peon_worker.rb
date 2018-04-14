class PeonWorker
  include Sidekiq::Worker
  def perform(who, message)
    logger.info "Message from #{who}: #{message}"
  end
end