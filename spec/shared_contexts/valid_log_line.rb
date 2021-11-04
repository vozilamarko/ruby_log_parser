# frozen_string_literal: true

shared_context 'valid_log_line' do
  let(:route) { '/page/1' }
  let(:ip) { '192.168.6.6' }
  let(:valid_line) { "#{route} #{ip}" }
end
