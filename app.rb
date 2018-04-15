require_relative 'time_format'

class App

  def call(env)
    @request = Rack::Request.new(env)

    case @request.path_info
    when '/time'
      response = TimeFormat.new(@request.params)

      if response.unknown_formats.empty?
        http_response(200, Time.now.strftime(response.time_format))
      else
        http_response(400, "Unknown time format #{response.unknown_formats}")
      end
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
