# frozen_string_literal: true

require 'spec_helper'
require 'visit_calculator'
require 'shared_contexts/valid_log_line'

describe VisitCalculator do
  include_context 'valid_log_line'
  let(:parsed_log) { [[route, ip], [route, ip]] }

  subject { described_class.new(data: parsed_log).call }

  it 'will performe expected calculations', :aggregate_failures do
    expect(subject.count).to eq parsed_log.uniq.count
    expect(subject).to eq [[route, parsed_log.count]]
  end
end
