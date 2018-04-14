class TimeFormat

  attr_reader :status, :body

  FORMATS = {
    'year' => ' %Y -', 'month' => ' %m -', 'day' => ' %d ',
    'hour' => ' %H :', 'minute' => ' %M :', 'second' => ' %S '
  }

  def initialize(params)
    @time_format = ''
    @unknown_formats = []
    @body = set_time_output(params)
  end

  private

  def set_time_output(params)
    set_params(params['format'].split(','))

    if @unknown_formats.empty?
      time_output
    else
      bad_format
    end
  end

  def bad_format
    @status = 400
    "Unknown time format #{@unknown_formats}"
  end

  def time_output
    @status = 200
    Time.now.strftime(@time_format)
  end

  def set_params(params)
    params.each do |format|
      if FORMATS[format]
        @time_format += FORMATS[format]
      else
        @unknown_formats << format
      end
    end
  end

end
