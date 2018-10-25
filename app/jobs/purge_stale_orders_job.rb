class PurgeStaleOrdersJob < ApplicationJob
  queue_as :default

  def perform()
    puts "Hello!"
    sleep 5
  end
end
