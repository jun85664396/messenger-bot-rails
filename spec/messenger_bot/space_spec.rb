require 'spec_helper'

describe Messenger::Bot do
  it 'has a version number' do
    expect(Messenger::Bot::VERSION).not_to be nil
  end
end
