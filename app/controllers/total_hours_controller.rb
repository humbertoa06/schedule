class TotalHoursController < ApplicationController
  def index
    total_hours = Shift.group(:day)
      .select('day, SUM(duration) AS total_hours')
      .order(:day)
      .pluck('day, SUM(duration) AS total_hours')
      .to_h

    render json: total_hours
  end
end
