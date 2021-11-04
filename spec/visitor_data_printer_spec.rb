# frozen_string_literal: true

require 'spec_helper'
require 'visitor_data_printer'

describe VisitorDataPrinter do
  let(:route) { '/page/1' }
  let(:visit_count) { 7 }
  let(:parsed_log) { [[route, visit_count], [route, visit_count]] }
  let(:type) { 'visits' }

  subject { described_class.new(visits: parsed_log, calculation_type: type).call }

  context 'when printing visit' do
    it 'will print calculated visit count output' do
      expect { subject }.to output(/#{parsed_log.first} visits/).to_stdout
    end
  end

  context 'when printing unique visit' do
    let(:type) { 'unique visits' }
    let(:parsed_log) { [[route, visit_count]] }
    it 'will print calculated unique visit count output' do
      expect { subject }.to output(/#{parsed_log.last} unique visits/).to_stdout
    end
  end
end
