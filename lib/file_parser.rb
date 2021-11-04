# frozen_string_literal: true

# Receives log path and parses its data
# Checks log data validity
class FileParser
  def initialize(log_path:)
    @log_path = log_path
  end

  def call
    parse_log
  end

  private

  attr_reader :log_path

  def parse_log
    parsed_data = File.foreach(log_path).each_entry.each_with_object([]) do |line, parsed_log|
      parsed_line = line.split if line_valid?(line.split)
      parsed_log << parsed_line if parsed_line
    end
    parsed_data_any?(parsed_data)
  end

  def line_valid?(line)
    route_valid?(line.first) && ip_valid?(line.last)
  end

  def route_valid?(route)
    return unless route

    route_matcher = '^(?:\/[a-zA-Z0-9_.-]*){1,}'
    route.match(route_matcher)
  end

  def ip_valid?(ip)
    return unless ip

    ip_matcher = '^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$'
    ip.match(ip_matcher)
  end

  def parsed_data_any?(parsed_data)
    return parsed_data unless parsed_data.empty?

    raise 'No valid data in provided log!'
  end
end
