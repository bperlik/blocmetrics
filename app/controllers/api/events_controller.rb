class API::EventsController < ApplicationController
  # for this project, disable the CSRF protection filter
  # in production, the app is more secure by giving CSRF token
  # to the client code before submitting the event.
  skip_before_action :verify_authenticity_token
  before_filter :set_access_control_headers
  skip_before_action :authenticate_user!

  def set_access_control_headers
    # allow requestes from any origin
     headers['Access-Control-Allow-Origin'] = '*'
    # permit the POST, GET, OPTIONS request methods
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    # allow the header Content-Type, which is used in HTTP requests to declare the type of data being sent
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    # return json error if build is nil, flash messages for save successful or error

    # RIZWAN  expecting #params[:name]
    # params[:event][:name]

    # test using curl command
    # curl -v -H "Accept: application/json" -H "Origin: http://marks.com/therese.senger" -H "Content-Type: application/json" -X POST -d '{"name":"foobar"}' http://localhost:3000/api/events

    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = registered_application.events.build(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render json: { errors: @event.errors }, status: :unprocessable_entity
      end
    end
  end

  def preflight
    head 200
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end

end
