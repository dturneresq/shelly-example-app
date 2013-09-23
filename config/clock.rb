require_relative "../config/boot"
require_relative "../config/environment"
require 'clockwork'
include Clockwork

every 5.seconds, 'frequent_worker.perform_async' do
  FrequentWorker.perform_async
end
