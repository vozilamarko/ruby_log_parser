# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:all, &:silence_stdout)
  config.after(:all,  &:enable_stdout)
end

public

def silence_stdout
  @original_stdout = $stdout
  $stdout = File.open(File::NULL, 'w')
end

def enable_stdout
  $stdout = @original_stdout
  @original_stdout = nil
end
