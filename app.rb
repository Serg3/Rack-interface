require_relative 'time_format'

class App

  def call(env)
    @request = Rack::Request.new(env)

    if @request.path_info == '/time'
      time_output = TimeFormat.new(@request.params)
      http_response(time_output.status, time_output.body)
    else
      http_response(404, 'Not Found')
    end
  end

  private

  def http_response(status, body)
    [
      status,
      { 'Content-Type' => 'text/plain' },
      [body]
    ]
  end

end
