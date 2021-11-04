# frozen_string_literal: true

require 'spec_helper'
require 'file_parser'
require 'shared_contexts/valid_log_line'

describe FileParser do
  subject { described_class.new(log_path: log_path).call }

  context 'when log is valid' do
    let(:log) { Tempfile.new(['test', '.log']) }
    let(:log_path) { log.path }
    let(:invalid_line) { route }

    include_context 'valid_log_line'

    before do
      log.write("#{valid_line}\n#{invalid_line}\n#{valid_line}")
      log.rewind
    end

    let(:parsed_log_matcher) { [[route, ip], [route, ip]] }

    it 'lines will be parsed', :aggregate_failures do
      expect(subject.count).to eq parsed_log_matcher.count
      expect(subject).to match_array(parsed_log_matcher)
      expect(subject.first).to eq [route, ip]
    end
  end

  context 'when log is invalid' do
    let(:log_path) { 'spec/fixtures/invalid.log' }

    it 'error will be raised' do
      expect { subject }
        .to raise_error(RuntimeError, 'No valid data in provided log!')
    end
  end
end
