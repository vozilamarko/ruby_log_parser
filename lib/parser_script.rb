# frozen_string_literal: true

require_relative 'file_parser'
require_relative 'visitor_data_printer'
require_relative 'visit_calculator'

# Receives log path, checks basic path and file validity
# Triggers parsing, calculation and printout
class ParserScript
  def initialize(log_path:)
    @log_path = log_path
  end

  def call
    validate_provided_log_path
    log_parsed = FileParser.new(log_path: log_path).call
    visit_count = VisitCalculator.new(data: log_parsed).call
    unique_visit_count = VisitCalculator.new(data: log_parsed.uniq).call
    VisitorDataPrinter.new(visits: visit_count, calculation_type: 'visit').call
    VisitorDataPrinter.new(visits: unique_visit_count, calculation_type: 'unique visit').call
  end

  private

  attr_reader :log_path

  def validate_provided_log_path
    raise 'Log path is not provided!' unless log_path

    raise 'Provided log path is invalid!' unless File.file?(log_path)

    raise 'Provided log is empty!' if File.zero?(log_path)
  end
end
