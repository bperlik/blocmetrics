class API::EventsController < ApplicationController
  # for this project, disable the CSRF protection filter
  # in production, the app is more secure by giving CSRF token
  # to the client code before submitting the event.
  skip_before_action :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    # return json error if build is nil, flash messages for save successful or error
    if registered_application event = registered_application.events.build(event_params)
      if event.save
        render json: event, status: :created
      else
        render event.errors, status: :unprocessable_entity
      end
    else
      render json: "Unregistered application", status: :unprocessable_entity
    end

  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
