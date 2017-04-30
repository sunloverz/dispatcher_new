class PlanesTakeOffJob < ActiveJob::Base
  queue_as :default

  def perform(plane)
    seconds = 10
    sleep(seconds)
    plane.update!(status: Plane.statuses[:departed])
  end
end
