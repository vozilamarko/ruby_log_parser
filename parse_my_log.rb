# frozen_string_literal: true

require_relative 'lib/parser_script'

ParserScript.new(log_path: ARGV[0]).call
