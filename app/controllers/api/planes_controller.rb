class Api::PlanesController < ApplicationController

  def index
    planes = Plane.all
    render json: planes.to_json(include: [:histories])
  end

  def take_off
    plane = Plane.find(params[:plane_id])

    if plane.update(status: Plane.statuses[:waiting])
      PlanesTakeOffJob.perform_later(plane)
      render json: plane
    else
      render json: {error: plane.errors.full_messages.join(', ')}, status: 400
    end
  end

  def ajax_status
    plane_ids = params[:planes] || []
    planes = Plane.where(id: plane_ids)

    render json: {planes: planes}
  end
end
