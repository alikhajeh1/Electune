require 'spec_helper'

describe Upvotement do
  it { should respond_to(:upvoter) }
  it { should respond_to(:playlist_item) }
end
