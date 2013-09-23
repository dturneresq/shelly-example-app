class FrequentWorker
  include Sidekiq::Worker

  def perform
    sleep rand(30)
  end
end
