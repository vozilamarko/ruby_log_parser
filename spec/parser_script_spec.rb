# frozen_string_literal: true

require 'spec_helper'
require 'parser_script'
require 'tempfile'
require 'shared_contexts/valid_log_line'

describe ParserScript do
  subject { described_class.new(log_path: log_path).call }

  context 'when file path is valid' do
    let(:log_path) { 'spec/fixtures/valid.log' }

    it 'should parse the log' do
      expect { subject }.to_not raise_error
    end
  end

  context 'when file path is valid and log data empty' do
    let(:log_path) { 'spec/fixtures/empty.log' }

    it 'should raise an error' do
      expect { subject }.to raise_error(RuntimeError, 'Provided log is empty!')
    end
  end

  context 'when file path is not provided' do
    let(:log_path) { nil }

    it 'should raise an error' do
      expect { subject }.to raise_error(RuntimeError, 'Log path is not provided!')
    end
  end

  context 'when file path is invalid' do
    let(:log_path) { 'path/invalid' }

    it 'should raise an error' do
      expect { subject }.to raise_error(RuntimeError, 'Provided log path is invalid!')
    end
  end
end
