require_relative "errors"

class Booking
  attr_reader :user, :resource, :status, :created_at

  def initialize(user:, resource:)
    @user = user
    @resource = resource

    if !resource.available?
      raise BookingError, "Resource already booked"
    end

    @status = "active"
    @created_at = Time.now

    resource.assign_booking(self)
  end

  def cancel
    if @status == "cancelled"
      raise BookingError, "Already cancelled"
    end

    @status = "cancelled"
    @resource.clear_booking
  end
end