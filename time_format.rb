class TimeFormat

  attr_reader :time_format, :unknown_formats

  FORMATS = {
    'year' => ' %Y -', 'month' => ' %m -', 'day' => ' %d ',
    'hour' => ' %H :', 'minute' => ' %M :', 'second' => ' %S '
  }

  def initialize(params)
    @time_format = ''
    @unknown_formats = []
    set_time_output(params['format'].split(','))
  end

  private

  def set_time_output(params)
    params.each do |format|
      if FORMATS[format]
        @time_format += FORMATS[format]
      else
        @unknown_formats << format
      end
    end
  end

end
